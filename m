Received: from sonic310-24.consmr.mail.ne1.yahoo.com (sonic310-24.consmr.mail.ne1.yahoo.com [66.163.186.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBC11DE4CA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.186.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743186255; cv=none; b=aaAPI3O5YDEWLU02Bn4YeZAy9BjPKFq6Y1lbW+Tg+VSUi0hgjENDPhK/goNV8e8PyGoXPnBqZWRmUrZyrBSWfaBDP672754fkCb/SnP7Ql6X6wzavCGX/3x3Z2LWTdZznb0zfAZjq3v3ECxxslERnREwWQA01+AJ0nH1eSZ+rkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743186255; c=relaxed/simple;
	bh=sNVpG5XIjB+pX3mut/nkpFA+1WsjSTOGRcLZd/fijOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prFD1+6kyd/2ICtPwngGHTSTchoSvtPrECnR9ZPtwz8Klp1ASCVoUqZzLzIgt5EitDqeGIi9zFXbMejLIcQhvjV3HZ23z6PHkqQ7f7ui8wu6UaKvvirMruF50TzrQLyukzoMhZA/buqsbYrV6qdsPirkovnzHm+bS/OiPZM1JIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ahaVREt8; arc=none smtp.client-ip=66.163.186.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ahaVREt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743186246; bh=9MnHcX2A4L4OYGwOE9U4aHakGVCcZ0Iv/6AEp+MiSXo=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=ahaVREt8vXNsjF0+1kM6dMxx6OmAH6y7mOaZNRzX1e3HOghrO8FYQeh6YJRdvVtF3Rw+9b0OYjNJJgomOOONHdJtG1au7o2HRHRodopCtozxCVgx38l1iWeX4Uv1z56scO8jKStUHYrNbK6RV0FQ6TfZ1mYjCVnrjLCHnLPI0EAvSHH60pjheY4KUziLg8Roq9yJOvPAbLsMwt2sgHLqqdmVrRkOnxHUi95xW2neKBbv7dk/ZH1mguQacst2z0v5d3aJvAoNoyLughmBtdC7RnCIc76OUam8TKeYh3tU7Xm1Rw5HLjGwpLWEbZlAIDW8g8vAXt7S6hOYNLg4VU3PZw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1743186246; bh=QeTBzQXEzL15ooirywH7BD8lQ89Rbciw5euLey4ZMLF=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=n2jAgeucc4X8TuEhrkZbJcF/1XWn1goLTEaVCGQvrzvYKktaQzOVxaGZnnDrHfSLW9TUjBpi6+mtSmzeKYFFQryQI3OQpsKctxXcSLT+7DZW3MZ4Y184Yxeir936P2A3WicaZVAl1QZR2ob9nuBzZwMxwKQcSv0PD0XKMTq/+Ulu2xhdmmdxIMjh3JCtkbAH75b/dlO+EoPbxUxW+hPRkeOuhrswLIEykDCfA/6MzjsAwCKnlNE5f3bb86AvfnK18AGfQU3MjW6uGxjflnFCdEZZ/cZtr1ddRSgdLIVZLVLHRL6hrBdQl4R1dcM5ghpHoB5CyzZNjHiL7597kFSoMw==
X-YMail-OSG: LYpTqwwVM1kPYC8KKvRLGBggb5RqQuBOvNeXqOzlG_mvEw_fRqGkl56sAwKC_XF
 Rs2cfOpU_Zv89su9PfaJkD2MDRBYPqfcQdBRXkur2wihBy4OlDoY6VY9nIlr2ksNoeKmWPpZsqCh
 2gPfLqLJ8Y1pVw3D0J2La_YSf.1yx0hyXx6fgRfmhO_w4HBZQI3aupbItMq2OgveCiYXdsDpUROa
 GMIQF8MH4Hz4U7TqPQMp_wXLhg6lDnzkM8wvzf3GORTXfl8a0skG0y0XvL13YEY9xdUKAbkv4rYN
 nKM02JgL0og.iczIgFaS0cxWwZuEyDYUQfdXctXYekAaWeife4mQnvSo8sgTRBKKWOiPrRQP3Usl
 .Nge5Nf.xMC4nMcBnCdDPmvY7MudXPdLLVYxzRuwc3lFF3wKQQsxbPg_b5q7CLh6vtPd98lD.u5H
 VczzUijE7pVx5gQNcEtW3mpB6b5zQ5HxouWiNfyELgP6qUkwFh9kQ7EH5FdmY_rzxB.NxXeM4DaT
 _bx1vFfa1sZ2n9tkriuQST1gaciSajDUXvdXx11WWktJybh7OVVWYeGZDvSSPd5hP1Vct3EW.qDk
 rg38L1j.0pwhh7sze.M.X3aVcIQTfykMF8fxSce1q_Oqbg8z7c1Oq.KW00ScWOrQWPVp5gW_L2nv
 Vj5j.FNGMbvkeUdgzkzgfcye3fFPS60WHAKQnna56ACqzAvEnTRpDRtzNAQ9w.njVPjvBOp_4P_z
 znvMK5zxheI0bFTF5Gbjb.wT4PpFF.w.q9lVZHuzA8yJauklQUi0lrRlQHPp.neMp55T2g0._iuZ
 jNRjJmsgoVYo6VbBBjm1xKWP9PHjdx577QlDtuLtcYt6tZ5ENWZ3PbJVODcw4esPzuXcvE3GQjsk
 ec68MHRpyxF923OnkVp9SiB2C0PbgNXOR00vEzR.W344irzdCVRstMH0bZtuKkWUpbZ64dRcKaVE
 tQsbU6rPJODyunJTVf27AiwM6kEjUe9dwgu4863lqOD01M2ioaQzD4aDGMXpbV_s_ASKp29xPTOl
 Zri3ZBxqEa8U.FaX7PedCTbI9lBIc5G260BidhSYxdEj2mIG.kayUBQtsPHDCGWigc..wHLHZmPC
 UUL6AVwSZpwSJjcQPAb25NJ3qD_peENriflhjeUeYJY8GJoRWRcRtLmb8v916AEItoQb70g5w17c
 .pXeh7ziHyfT1rada.d3gQLriZFValnXeOe3OUixprBoD8JPlclpEbSVXEZhVHALpY.AEo6Ft3_E
 w7lZMe6uW5gO_0a2jvY82UGQS8czC5fxBtw4FfuWEQNLa3.U8wOjty7Xv4xAAyz7YWmm2SxjCcAQ
 8_pXD.Opk6aNkeuAZXvVJil6j3KPmPEIpL.bNRSgjXbqG7fbZ4IU5qiRnmILirwkxwM.jgVDIfVi
 wCbme9eDnClMkWpkMB9nRR7nnnsO7HqT4LrJgy6cXmKgUuGyw1xg.UuL4ol2EB5myqVbyiadyE4e
 hIIr_D7pcZTcvDgGsVWz7RF1u3u9RHzfp2kKd23pNwH2jMbZl4Ex6cHmjIQ2BcrpCf0EN86iFnbc
 4dEPF.k3hqTwlsi.cT7OUZy74dLj0o8PRjVyumz6pF.QPtm0ugBZZwXlglYBQkkaJFWZGhzlkbYg
 Lrl5bqA.d0zTiV4mP3K.b9aBQ9PvQ8MUU_y9OHZG546EN5FreKrX8sPRvxmdW00w5qlyoXBxxlVJ
 Uj62Hl5LjmyP.S8LxWrMUMpzaxi2ZiAcRPE4emDRtPwbbHmAs4l7SISUBqcvHnzhFrNIoI.A7P4k
 YqTI1OuKBfVad.uAJ1oBrPGCWOX8oUgQV6IAQDonLLgeBwpskxzIe454f7CNoi0Kg2CvGXiVS6Fz
 Yw7nVZjYQ1vWlXkhe1F4ogTQWcaH_vz0nSaxa5n.flaDh1QxhmwQxLStPpyA0PZOhEG2LnLpUKP_
 8uRn4IfHGBfeuloFeFNagHLjLiEabEaV9kGjdDTmN7cU6vEYHypo1_Yl9Mr9IKUSGG_8mEq4uuEQ
 FIYQ36W8VBM_zwN0qAUKgYGj1RDsr7CAJB3.c9c5ENyqbD8kJf9h2lc6kVOMD.7G7CSicVkJ9KTP
 xpPKiwYfErwc0M.XQWfd4QWAvE2HfJDOLSVroJZxLmnnkStGlwKcf0M_F8Mz6fl_IO7Moqzk0gf_
 weg0W_B6BSvumWp4OLJ43Q7S0YegUuvZNmPYr8tP3Y14awV1I.FlZXWlOrJwNmaX1ZEX6RLJZL30
 o7bAfWDRNtj8n.IChZ1JCeGcPvOfJNGsWUzjp9XqR_d3hfSRTu5soNy5IRkq7CshvDU3a
X-Sonic-MF: <igor.korotin@yahoo.com>
X-Sonic-ID: 3dc5702d-5e60-47eb-b6e5-c205bf811d25
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ne1.yahoo.com with HTTP; Fri, 28 Mar 2025 18:24:06 +0000
Received: by hermes--production-ir2-54ff696c44-sqp8l (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9492d6006d749a300ac3f1ee8e308470;
          Fri, 28 Mar 2025 18:03:50 +0000 (UTC)
From: Igor Korotin <igor.korotin@yahoo.com>
To: benno.lossin@proton.me
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin@yahoo.com>
Subject: [PATCH v2 0/1] rust: macros: Fix macro referencing core and kernel crates v2
Date: Fri, 28 Mar 2025 18:03:11 +0000
Message-ID: <20250328180312.2025317-1-igor.korotin@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <D8RHIOTYBFI5.3ETKTDNGZW3FH@proton.me>
References: <D8RHIOTYBFI5.3ETKTDNGZW3FH@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > To prevent issues where user-defined modules named `core` or `kernel`
> > could be picked up instead of the standard ones, update macros to use
> > absolute paths, `::core::...` and `::kernel::...`, for core and kernel
> > references.
> 
> Please split this sentence up into smaller parts. Also "standard ones"
> sounds weird to me, `core` and `kernel` are crates and not modules.

Simplified the commit message.

> > Suggested-by: y86-dev <y86-dev@protonmail.com>
> 
> Please use my real name and other mail address instead:
>    
>     Benno Lossin <benno.lossin@proton.me>

Sure. Tried to find your creds via your github profile/commits without 
success.

> > Closes: https://github.com/Rust-for-Linux/linux/issues/1150
> > Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
> > ---
> >  rust/ffi.rs                  | 2 +-
> >  rust/kernel/device.rs        | 2 +-
> >  rust/kernel/device_id.rs    | 4 ++--
> >  rust/kernel/kunit.rs        | 8 ++++----
> >  rust/kernel/static_assert.rs | 4 ++--
> >  rust/kernel/str.rs          | 4 ++--
> >  rust/macros/lib.rs          | 6 +++---
> >  scripts/rustdoc_test_gen.rs  | 8 ++++++--
> >  8 files changed, 21 insertions(+), 17 deletions(-)
> 
> There are also some occurrences of `kernel::` & `core::` in proc macros,
> for example:
> - rust/macros/kunit.rs:129
> - rust/macros/module.rs:347
> - ...
> 
> Could you also add those to the patch? Thanks!
> 
> (line numbers after applying your patch to rust-next)

Agreed. Fixed references in auto-generated code in files
1. rust/macros/kunit.rs            
2. rust/macros/module.rs           
3. scripts/rustdoc_test_builder.rs 
4. scripts/rustdoc_test_gen.rs     

-- 
2.43.0

