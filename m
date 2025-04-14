Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27FB1C75E2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662369; cv=none; b=JRPYhPgwhLBVrqnMoJhiv/7YSuGv9A7DqR++tEluMb6doiJYFE1VFMynaJkN2WRUhO9z9qM+XRF4YXgTiM2ng/N3CQBR2tC2C2meibUBw7NxV3vUFCG20JjY+FFPAg+YrLATyQQMOQkVmsVSto+TwW+FxRuOKXKxS80v0pFPgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662369; c=relaxed/simple;
	bh=e8RuQjvX7EC8rJIFazxow+KpM5ax/UsWJUoMj3kPKTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8qj1pd+i0od5mdm8/38+8bicMpqjvt3uW99rFTkAPTJgqjvLixlO2VJV6/OnxwAouH4v4Lja8P9kDI0g2oydIarU3zrwPUonpipvM4Kbak8VKaH7QEw0YAD7sb5qgyIY5BMKye3oekztMBcYvrFALSL0zaHBOOILalgPy7CXlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KRKKA9KT; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KRKKA9KT"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e6e2a303569so3601184276.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744662366; x=1745267166; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8RuQjvX7EC8rJIFazxow+KpM5ax/UsWJUoMj3kPKTI=;
        b=KRKKA9KTJLwDOv/j85iqeAteHbnRRThNrFG1v9dr9pIvRgMvzICKCPFyrZO2Y3oUbR
         tutVDXS0X/8k1V/4dWxHPiqLZFSVfQGhXEAZZPdhCBUkYHOVKkeK5iwBWHcAYPZXLikA
         CECW1DqWpq6jcDUMFF4GbmIZB+PxBz32qmragIPXFTGnZR3L2FlhKqTPwjIPAYBinGpo
         HaxzZKEF/kHKeMFxWhs+woabXNqxnUrmYd7pe7DE20q/ldq+337zRrgGacCLMNKRVk9a
         EnHhVWJeMir1zo60IwygqgZrRKwHeHf56sqyKN2fxMcM28nLHSQKQW22TnzpAHrH5PI9
         8PkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662366; x=1745267166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8RuQjvX7EC8rJIFazxow+KpM5ax/UsWJUoMj3kPKTI=;
        b=QGpeItF2HkpgsPxuRN07dHi25/n2MQB/IvIFoxbr74e/UsODg2YyDG9ePS5+pDsiDD
         KQC9+nVHdu1rAmOCf8bu/OtlPm5MxBxS0L4ewJpMFD4BJNKttbC2hQQXbCOIVez9/c+2
         rEd0jub4lYhxRaSaIqe8O6IUROSCXM9f45x+aQe2btU/+RZMrDBAtR4E2qxsySWZkcee
         sjbnRVkxeiG9ooRHS9fdoT0Y8RyjPfuNWVtv4+rXmAxvHsuyVKmNkQqhzNPdUanuHnCF
         QCSSefg6MWO1IxdGCT99gsK3Ko3nLZvUTTS+QF2hlHTsp5WrDyNagXlvjfvW0UYEMxYm
         /PXA==
X-Forwarded-Encrypted: i=1; AJvYcCU6vtdKmU1/11+uOnOULE0WZZdtLeKk8PwXVyVTfH1S1Kwf5kbm75X/hLFWPFRsIahFcpX6in6GrOEzrPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrvnWZDRDA7ckuMWKT1c8VjCMmJkVgvHyusJWfbQFETTCUpbQj
	dWNX20l1F9lWWX/8BDHTp0q4+5QAYuerU/sPCuYtquBtqx96kn+MOjS6K+m5HMgFpSUblFz5su9
	a7SinLR5ece1w6Mk2XBndNgdoL7SCbHyhcoA2
X-Gm-Gg: ASbGncs69iayxgkbSywpldRYcVc4LxCAblEGkNOcGIZ45Qw/OnDl3DmrZv22WQO3icT
	3458i4DLP31GY30p65SkkyU5YOImJWd4hSYlMmZIKg5jDLVMP1oed+gQGINlGBx5e54H1jiPnZm
	E0kwFGqg1b/d2U597NRr1mJqOK1mmUKBIB/H4vVDPbhMgxheiEw7SIMQE/889XWQ==
X-Google-Smtp-Source: AGHT+IHim7LKMVAssyTOnOfMgHoryUchjWHO0ARJ2hg5JmtdO8AhbqOEh3YOdPUF47H4HZYQwddbnu499M0vFJgq5eU=
X-Received: by 2002:a05:6902:4912:b0:e58:a25c:2787 with SMTP id
 3f1490d57ef6-e704df84608mr21722964276.38.1744662366434; Mon, 14 Apr 2025
 13:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414200929.3098202-1-jthoughton@google.com> <20250414200929.3098202-4-jthoughton@google.com>
In-Reply-To: <20250414200929.3098202-4-jthoughton@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 14 Apr 2025 13:25:30 -0700
X-Gm-Features: ATxdqUGwhQ01tB21e31AgRtLSVaaR6Jizfi-T6B2oRJ8KFk1W8QQrgJ2NgNsjhU
Message-ID: <CADrL8HWfF84VLmrVkzXTdwi-xxbUTPRUBDx1URZOsYv1DuB1-Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] cgroup: selftests: Move cgroup_util into its own library
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, 
	David Matlack <dmatlack@google.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 1:09=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> KVM selftests will soon need to use some of the cgroup creation and
> deletion functionality from cgroup_util.
>
> Suggested-by: David Matlack <dmatlack@google.com>
> Signed-off-by: James Houghton <jthoughton@google.com>

Tejun had provided his Acked-by[1] and I somehow forgot to include it.
(I know I should just use b4 and redownload the series with
everything...) Sorry about that.

[1]: https://lore.kernel.org/kvm/Z-sQ76PG14ai9jC0@slm.duckdns.org/
