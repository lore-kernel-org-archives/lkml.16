Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86572222C7;
	Thu, 19 Jun 2025 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332816; cv=none; b=qAtTLXmAyqQ825nZeUagUeFPmZ/LtQjEFa4WwN3OR5DTwpy+WJ/JyjBKZXhfCBaYECcQJ60w39htcwLh0t/HCWrrv8U4aOeMUlTMp1AEvHx1jQngouRFHyfp0134KkR5C6ksyJoL6AS36u6lYTbyWbn/4ukJ00nMUafHe3uyLx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332816; c=relaxed/simple;
	bh=9V3A9jdafqL94aEYcoQ3q0iNtKNV3K4WcsQBgP2Zm/8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oJ7YvlYoWrAK6Lrzc6WwKJXLkYboa5w34DByFndTM+BmUOrFRGlKJb52Rw641K2kiidnZU2nVEv3N+206PgmY3d7Ttd12SndCGrve4kL7/pm+ZlBToJa66pfxtmW/79VG5PpXn3Bvnx4EnKxb0shUkCf2PT6legBHvNabO1cUCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yqi33H6k; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yqi33H6k"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-236377f00easo9646455ad.1;
        Thu, 19 Jun 2025 04:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750332814; x=1750937614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojRZDlbrrzV6CB3HIog+4FXkQsvvK9WMXjw+UQ+kjSs=;
        b=Yqi33H6kVCM+PonHtImcVeubo6lV+qlfC/xir4MWFMcLN7orxCze5q1iJZfOpB7UJt
         pSIbOqMtMx51LGzgu0lkicyfnACUMLk0pe7hgRS0yiF0KY592Cgr7u5F7o1TvH1Bmwum
         eZ6mes7e2w79D8aGjBzAxqH0mMnGBVlSSzywRdbRBCji2ZlgjvUcRP3KnftRD3vdbmoR
         N376aXPJbZ3APCt7CMvHFTAeiZPdA/CydizThMhc2xlt7KszAKVMKBfCNFkKp3OmzcLn
         VZ3Rh5RT2bxbn93jHweneyR+b//QOds0VLx9cT4lf4jyZ5JS2a4ot/2u1eBj12GhsfYX
         yeog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332814; x=1750937614;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ojRZDlbrrzV6CB3HIog+4FXkQsvvK9WMXjw+UQ+kjSs=;
        b=peSNa/l1vlzaGkzfXtp33tlenlVzSnJ5LEXoxsDTc68Y4NGVaOgTDeNF08dAALrDtM
         0qyEPZ9RyT6NQ4FFay6qpC1e5Bwi62lTw+H6QVuVpR8HiiEE1xR+kGT8qp4PxfrUIWOR
         yz4lCjqLaB1Ell2bG8xdSLP4g1PaxuZQOxGdpLQ8ksd3x0cGh0sg+oZk6aMeFzNWBF9c
         JOeALNDj0f+WeCMWefQ+7rYuOPwbzGbTOUt+y8wEG/qg7raY0/WXLJSReMLdYmTfOSXZ
         O0veO0OXsau7h7nn6xVsIwtozMG+ciRMuLjMe8v6s/0JkNdHOd4D8p3ZtabanGeD5i0o
         toBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvihEUl+KSZmNsu9nyn8smg7xjUG/YjjoVX49QDPM1IdqQkBqMTMa2lOgnODNfQIMVbVZXOZR/qKMdDZ9x+AE=@vger.kernel.org, AJvYcCVqvJVd8u1R35qXmg8jzj5rjtN34KpL9a0c65d0RWXeTfb25Uxb4R0UjmEA9EdgTTmjAYLtG6aF2z6sbZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlAdnSDO9JaxCADS5fwIRWgvy79SfTnx6pTEBCBOf6SwGzTGtM
	CFymUlsZTu9zigPukLTVz258XsWqXmZT5nzk2BuWpO7PEmrXI8rN42Mc
X-Gm-Gg: ASbGncvrAJ/bJT47WTzWhEi0j5xEWQtKvwc5UEHUwxmOcU35xj7YQakzmcQPIBmPT7v
	XqnsQFjk+DrZ+pgwvFkof+TiaTJAztD3AxLhyxQnl1hY/T9XRMkBTM59NUIACQliV4C0p5Gu3tI
	gcEjBaVoRPuhcDn3S6+9IFdm/cMyCiZo+sVVNPFBbrrIzr98P+Xf7ILZvbypxH1wx5rBIdnisG6
	59kNyYnYKY0qxmsLOjIauShV7fGUlkIkcuNRtouUrF2BL/ZJVI2GVlFmqQSt0GPukEozsIe1SdH
	ro0jcg0KEfPBDah6GTK/gAPPJXWADwueHdI/r7LKqgd84YYqu1xRgrnqOhuNqYfP8z0pLC1BqJd
	hD+OZ6q/HJ2g+7exJXEy4u1cwBDPX8nPTHG6nT0ci
X-Google-Smtp-Source: AGHT+IF2A2jRX5KagilzI6mJCQv+F8H7qR+VxAw13++/pOfRkcUUD5DYiDw8lryf+lRpOd5+NWIM7A==
X-Received: by 2002:a17:902:fc87:b0:234:d679:72e9 with SMTP id d9443c01a7336-2366aff8c49mr372543625ad.12.1750332814240;
        Thu, 19 Jun 2025 04:33:34 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca368sm117349015ad.201.2025.06.19.04.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:33:33 -0700 (PDT)
Date: Thu, 19 Jun 2025 20:33:19 +0900 (JST)
Message-Id: <20250619.203319.1745503493999032815.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, alex.gaynor@gmail.com,
 ojeda@kernel.org, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87cyb084df.fsf@kernel.org>
References: <lliFJqf-6WmrKCArjCpOguz4jsHNtiF9GU0X4Ip5bE8NseTdlyKNH_7Bp_CyxNBD5ZR-Jbz0teNRS4UgV_7Z3g==@protonmail.internalid>
	<20250619.092816.1768105017126251956.fujita.tomonori@gmail.com>
	<87cyb084df.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 19 Jun 2025 11:31:08 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> On Wed, 18 Jun 2025 21:13:07 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>>
>>>> On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
>>>>> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
>>>>> > Prevent downstream crates or drivers from implementing `ClockSource`
>>>>> > for arbitrary types, which could otherwise leads to unsupported
>>>>> > behavior.
>>>>> >
>>>>>
>>>>> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
>>>>> long as the ktime_get() can return a value in [0, i64::MAX). Also this
>>>>> means ClockSource should be an `unsafe` trait, because the correct
>>>>> implementaion relies on ktime_get() returns the correct value. This is
>>>>> needed even if you sealed ClockSource trait.
>>>>>
>>>>> Could you drop this and fix that the ClockSource trait instead? Thanks!
>>>>>
>>>>
>>>> For example:
>>>>
>>>>     /// Trait for clock sources.
>>>>     ///
>>>>     /// ...
>>>>     /// # Safety
>>>>     ///
>>>>     /// Implementers must ensure `ktime_get()` return a value in [0,
>>>>     //  KTIME_MAX (i.e. i64::MAX)).
>>>>     pub unsafe trait ClockSource {
>>>>         ...
>>>>     }
>>>
>>> Nice catch, it definitely needs to be unsafe. We should also require
>>> correlation between ID and the value fetched by `ktime_get`.
>>
>> What's ID?
> 
> 
>   pub trait ClockSource {
>       /// The kernel clock ID associated with this clock source.
>       ///
>       /// This constant corresponds to the C side `clockid_t` value.
>       const ID: bindings::clockid_t;
> 
> The constant used to identify the clock source when calling into C APIs.

Ah, I see. Sorry to ask another question, but can we require
correlation between ID and the value fetched by `ktime_get`? The value
fetched by ktime_get is opaque, isn't it?
