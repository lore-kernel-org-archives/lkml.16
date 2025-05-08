Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264E74B1E48
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697864; cv=none; b=ZyJfLLXi4P8aXCxkAL0aaKjiWE7YkN9QM6G5TEueZHwunG3neKrfOfAd++7DVvxsI+NHSoMb0MP7++LkdfUKxXGMZoUQmGwk1FAuUmm3lUc+9PNkMynfUU9jxdoJwANl22bXJFpHNYwrvWle2lDhRknhjjZt1qYQNnHmGdSfZJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697864; c=relaxed/simple;
	bh=ilKpTcN1qWzpcVnlhS8lmE0PoQN0fNO30dAf76HsnHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WD9wI4C1gpgSe0FG9LGYmRaZIKxe7Gl3zuxGyhvmhkGF4aE5+4l6nif3vYk1ZCHdc1a9I2H7mtIvsTvJcT7VcJTqnSbBzMz5j6unfb64+jH9j71EuuZ5UTLFXreoe/7omaAL1YkUuxR929Vd0OriiPM/U9FoLFWwI88RkcyMYlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2hQj3MkC; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2hQj3MkC"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-44059976a1fso2969015e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746697861; x=1747302661; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sRYORIdHbCu+v7v6CRkN0ZTKr0/OiODNbHOIpEPqKvI=;
        b=2hQj3MkCHoWEqacI2nvdHUxERFuGeYWTmfC9r8tuHAhq/2Mms1N8xwpV1PVwdXbF+3
         jjIkXgqBC/ES6SmSsJUWUdf24jVXKB/OBMMlBRP2Kvci92qz+ZAaMcgcpRwkTiJpoZih
         cGPsujZ9/R1f/WNwcWD6efuzCK6B9/MCn34sopLJxlxXwBdnF3tFEKKjo/COta94/FKn
         LGvBUNR/15I8V6LkxRfengzxXorDeAE0aRVfPIQ/F1a58u4CrkHfR+Pc5oDaUidDDrjV
         uqBp7Ga36Zm2k5ZhCRqinApSCTXliE5P49De6Rkn3Z279CtGKOstI0Pwh8+KCtBMXuem
         bcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697861; x=1747302661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRYORIdHbCu+v7v6CRkN0ZTKr0/OiODNbHOIpEPqKvI=;
        b=tpWkaU3j4SAbB0niiNXTTqRW9cuci/Y6kR2PMgUOSlzNnXSXAvockNy7EilMPZHryX
         gPzaCCqV2MZjaN9O4S6Zo4HIyjkdtp4HrLPkQrhCWze4xMO0S0JBHOCaTXYHlBM9HV+o
         cXc96M/v1TwnKKqP0B/tQA6CQ7XOhK8rByQl3bbvDW5TJc+vaM5VYmb4I2AhIaxssE2Q
         Wot7aGZsrkP0wpiuOAqUSTze8U7yZ89sFmLqJsFpK6DlHV8ob1bnbSb2tZvd/e28VLpD
         ZLwP9eIGuSfAISkinfFpstbctoK8bgYxnwANb6p2bw9KiPVj4zNmqgDfysH9smW0bXIm
         6ejw==
X-Forwarded-Encrypted: i=1; AJvYcCVNg6RxVsyKWU1EJ0IOWmLWhEfLtqDcVrjnilSmMFN0JQnHkB3mvgEPEPPwDym+RVbYt201zc0Y7gy5JF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmQuzMCDug6E3wLfOl3xejjNQPX/t62ei/0HG6cC8JAArtOBLN
	T5ou1vdCT6nTaNqz/obEtV+hk55MQh4jVc84FiKDSACYgDd/PTlwSrVM2uLPoAFwpKY57k7ewl3
	uTn+B+a4Wvl3/QA==
X-Google-Smtp-Source: AGHT+IHLXsWRDgG3OD/xhwNN+TKEjftVuGlDJ1UzIgWhHqG8GP2ey/7z74RyCklt2SklhOgBNWfIa0zzBtlpALk=
X-Received: from wmbhh5.prod.google.com ([2002:a05:600c:5305:b0:43d:55a1:bffc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:698e:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-441d448c8a4mr66281965e9.0.1746697861579;
 Thu, 08 May 2025 02:51:01 -0700 (PDT)
Date: Thu, 8 May 2025 09:50:59 +0000
In-Reply-To: <aBuQgY4wMv1CsVdo@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com> <20250408-vma-v16-8-d8b446e885d9@google.com>
 <aBuE6a4rXB8qwXfF@Mac.home> <aBuOX0hTLZed3JND@Mac.home> <aBuQgY4wMv1CsVdo@Mac.home>
Message-ID: <aBx-g4qapwBc0K8C@google.com>
Subject: Re: [PATCH v16 8/9] task: rust: rework how current is accessed
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 07, 2025 at 09:55:29AM -0700, Boqun Feng wrote:
> On Wed, May 07, 2025 at 09:46:23AM -0700, Boqun Feng wrote:
> > On Wed, May 07, 2025 at 09:06:01AM -0700, Boqun Feng wrote:
> > > Due to this:
> > > 
> > > 	https://lore.kernel.org/oe-kbuild-all/202505072116.eSYC8igT-lkp@intel.com/
> > > 
> > > , I think we should move this impl block into rust/kernel/mm.rs for now,
> > > i.e. (in rust/kernel/mm.rs)
> > > 
> > >     impl crate::task::CurrentTask {
> > >         pub fn mm(&self) -> Option<&MmWithUser> { ... }
> > >     }
> > > 
> > > Thoughts?
> > > 
> > 
> > Hmm.. this alone won't be enough, because miscdevice also uses mm. Maybe
> > you could most of mm defined even when CONFIG_MMU=n but keep
> > MmWithUserAsync only available when CONFIG_MMU=y?
> > 
> 
> Something like this, probably? But your choice ;-) Make CONFIG_RUST
> select CONFIG_MMU is fine but the question is who is going to unselect
> that at when?

Please see:
https://lore.kernel.org/r/20250508083540.3832900-1-aliceryhl@google.com

Alice
