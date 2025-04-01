Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DAE1EE019
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743521602; cv=none; b=JZTRthg85GgxcbKzNicZmm69ysXZMuHLw8SDLQRPcuffm9M5uFE7a/t5n+F9bheaRnqqV6wTy4ZhpGVR/bd6L0CFUxj7qmaGPZoqnIGP3kZOstYCluP26ZQAin62+5XrRL2i/hWHJhgmGq1yl1HAx9KA8zp4mivhqhctWoDMYKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743521602; c=relaxed/simple;
	bh=t+Qib5nHnDXjaJVocaTTtqnSJieem+VXXFLu3b2856M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CS1hsZ3wrlA0z0gpWvcHhKPTn9Iuzeb76TeEJUIf8YCbF7hPUZx1J6u3YlpJS0nPOaaOEiw9gVXlKDwZ9aa9dzcqcu2/DgjQkZd2d6d4s42chCcP8qp8I1Hzm5vIurPng/Xjz1+tJEMweSR8qYYAGg1DickZRcoAFXO9VnKwFlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=CC+Q2tvS; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="CC+Q2tvS"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-477296dce76so51364981cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1743521599; x=1744126399; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t+Qib5nHnDXjaJVocaTTtqnSJieem+VXXFLu3b2856M=;
        b=CC+Q2tvShJN7qO5N+sWoFKT5/UApGhIEDpGdEnuWuB46XjhF7tPqWf+nXoydnNBGlk
         8XPLhP39jtwkuvZfcC1KQ8SE2YRZsNK5fchVQlphu4UyGank/hdBFHp3cCtoNYR1d3LZ
         Iean5Wm4zOCV0rOf0LRDsbO+vZVWYHcm8WljI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743521599; x=1744126399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+Qib5nHnDXjaJVocaTTtqnSJieem+VXXFLu3b2856M=;
        b=F786EvyIOJU6R0Msz9GuUbYoeGBg4Gjd3oz27IacCg5ul5xMXxRSzluV+o5ytI0Jb0
         9Fg/fuwyYxEDvo+jXNcjLt4w3ZCV/2HQSReKu/IZSdQMHAUENPsAUrpOuZDfK1AO2/h+
         07+eF2vmIN14hx4XaOxSqkvyLAbuSnHgXbsEyz2Ob887npab/DRhWDn/oaffPsVfvGtP
         8r/HxKcyRRzSopCghdeI14AG1YIJR3RJCsOkPdIhambtXYLeDYyzirbaVS1bpODmVhqF
         lCUlerVWwYyKGnjFcEF0TENsN+Z190L6GYeuXLPYD4WUfa8wGx+m94N/qqA9ZmgtgtJZ
         7MUg==
X-Forwarded-Encrypted: i=1; AJvYcCVg9aRffK3h7hGLnLfdpAEiM3l9LQMnQFd2GeGQkGYZW9TbJzvDH4u2fxGr7A4uqnvJvOdQe/wSwBQCLeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQPgUz0WqRuHNBL2t1gNOQ2z6XjRBJPj5ABYdMgP7D6wRSwEnS
	fPbiRrwGkG/rlz+Eqbjml9nwf9YchU9nm/uwYxmFOpOcDhe5BEf+9AbHOpVm6r1CVwwYY1HpeSE
	YdN6dDED6uVQCpdUTW5Btb2Vg/eeCc94YupQZRIgTgEdum/os
X-Gm-Gg: ASbGncuQ37a4rHCEoUJOZMghZvzaLZeCRSZCCewWdEUeSvd/VUrEEmGNr/Gi2rUblTP
	wnSJw1YsRa1aetyhEhYoDmptwKwTI/YGpsaKv9S1R84HqejiFRB614d5cjeVQieiPEhllQQuQfT
	JRPG7GqSxQqT4kdh5rsL9EL7yzkUeb1CYdlAj3
X-Google-Smtp-Source: AGHT+IHa116vmL2Z5Aq2fV2WY+Y2v/VkQaYSGka903hF+BoTbYKsBMlvaSypu1+9o1neeUM2mpRF+p5KebfED8HkIdg=
X-Received: by 2002:ac8:5cd2:0:b0:476:91a5:c832 with SMTP id
 d75a77b69052e-477f7aeaf03mr234289051cf.32.1743521599578; Tue, 01 Apr 2025
 08:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314221701.12509-1-jaco@uls.co.za> <20250401142831.25699-1-jaco@uls.co.za>
 <20250401142831.25699-3-jaco@uls.co.za> <CAJfpegtOGWz_r=7dbQiCh2wqjKh59BqzqJ0ruhtYtsYBB+GG2Q@mail.gmail.com>
 <19df312f-06a2-4e71-960a-32bc952b0ed2@uls.co.za>
In-Reply-To: <19df312f-06a2-4e71-960a-32bc952b0ed2@uls.co.za>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 1 Apr 2025 17:33:06 +0200
X-Gm-Features: AQ5f1JqNKTmfouI8hy05YpWvpZNhzZZXyko9L4FgdKti0LZRHnYUJqPtKnHWr74
Message-ID: <CAJfpegseKMRLpu3-yS6PeU2aTmh_qKyAvJUWud_SLz1aCHY_tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: Adjust readdir() buffer to requesting buffer size.
To: Jaco Kroon <jaco@uls.co.za>
Cc: bernd.schubert@fastmail.fm, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr, 
	joannelkoong@gmail.com, rdunlap@infradead.org, trapexit@spawn.link, 
	david.laight.linux@gmail.com
Content-Type: multipart/mixed; boundary="0000000000009a16360631b941a6"

--0000000000009a16360631b941a6
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 17:04, Jaco Kroon <jaco@uls.co.za> wrote:

> Because fuse_simple_request via fuse_args_pages (ap) via fuse_io_args
> (ia) expects folios and changing that is more than what I'm capable off,
> and has larger overall impact.

Attaching a minimally tested patch.

Thanks,
Miklos

--0000000000009a16360631b941a6
Content-Type: text/x-patch; charset="US-ASCII"; name="fuse-kvmalloc-readdir-buf.patch"
Content-Disposition: attachment; filename="fuse-kvmalloc-readdir-buf.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m8ynpz2y0>
X-Attachment-Id: f_m8ynpz2y0

ZGlmZiAtLWdpdCBhL2ZzL2Z1c2UvcmVhZGRpci5jIGIvZnMvZnVzZS9yZWFkZGlyLmMKaW5kZXgg
MTdjZTk2MzZhMmIxLi4xOGUzOTUwZTVmZjUgMTAwNjQ0Ci0tLSBhL2ZzL2Z1c2UvcmVhZGRpci5j
CisrKyBiL2ZzL2Z1c2UvcmVhZGRpci5jCkBAIC0zMzIsMzUgKzMzMiwzMSBAQCBzdGF0aWMgaW50
IGZ1c2VfcmVhZGRpcl91bmNhY2hlZChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGRpcl9jb250
ZXh0ICpjdHgpCiB7CiAJaW50IHBsdXM7CiAJc3NpemVfdCByZXM7Ci0Jc3RydWN0IGZvbGlvICpm
b2xpbzsKIAlzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmlsZV9pbm9kZShmaWxlKTsKIAlzdHJ1Y3Qg
ZnVzZV9tb3VudCAqZm0gPSBnZXRfZnVzZV9tb3VudChpbm9kZSk7CiAJc3RydWN0IGZ1c2VfaW9f
YXJncyBpYSA9IHt9OwotCXN0cnVjdCBmdXNlX2FyZ3NfcGFnZXMgKmFwID0gJmlhLmFwOwotCXN0
cnVjdCBmdXNlX2ZvbGlvX2Rlc2MgZGVzYyA9IHsgLmxlbmd0aCA9IFBBR0VfU0laRSB9OworCXN0
cnVjdCBmdXNlX2FyZ3MgKmFyZ3MgPSAmaWEuYXAuYXJnczsKKwl2b2lkICpidWY7CisJc2l6ZV90
IGJ1ZnNpemUgPSAxMzEwNzI7CiAJdTY0IGF0dHJfdmVyc2lvbiA9IDAsIGV2aWN0X2N0ciA9IDA7
CiAJYm9vbCBsb2NrZWQ7CiAKLQlmb2xpbyA9IGZvbGlvX2FsbG9jKEdGUF9LRVJORUwsIDApOwot
CWlmICghZm9saW8pCisJYnVmID0ga3ZtYWxsb2MoYnVmc2l6ZSwgR0ZQX0tFUk5FTCk7CisJaWYg
KCFidWYpCiAJCXJldHVybiAtRU5PTUVNOwogCisJYXJncy0+b3V0X2FyZ3NbMF0udmFsdWUgPSBi
dWY7CisKIAlwbHVzID0gZnVzZV91c2VfcmVhZGRpcnBsdXMoaW5vZGUsIGN0eCk7Ci0JYXAtPmFy
Z3Mub3V0X3BhZ2VzID0gdHJ1ZTsKLQlhcC0+bnVtX2ZvbGlvcyA9IDE7Ci0JYXAtPmZvbGlvcyA9
ICZmb2xpbzsKLQlhcC0+ZGVzY3MgPSAmZGVzYzsKIAlpZiAocGx1cykgewogCQlhdHRyX3ZlcnNp
b24gPSBmdXNlX2dldF9hdHRyX3ZlcnNpb24oZm0tPmZjKTsKIAkJZXZpY3RfY3RyID0gZnVzZV9n
ZXRfZXZpY3RfY3RyKGZtLT5mYyk7Ci0JCWZ1c2VfcmVhZF9hcmdzX2ZpbGwoJmlhLCBmaWxlLCBj
dHgtPnBvcywgUEFHRV9TSVpFLAotCQkJCSAgICBGVVNFX1JFQURESVJQTFVTKTsKKwkJZnVzZV9y
ZWFkX2FyZ3NfZmlsbCgmaWEsIGZpbGUsIGN0eC0+cG9zLCBidWZzaXplLCBGVVNFX1JFQURESVJQ
TFVTKTsKIAl9IGVsc2UgewotCQlmdXNlX3JlYWRfYXJnc19maWxsKCZpYSwgZmlsZSwgY3R4LT5w
b3MsIFBBR0VfU0laRSwKLQkJCQkgICAgRlVTRV9SRUFERElSKTsKKwkJZnVzZV9yZWFkX2FyZ3Nf
ZmlsbCgmaWEsIGZpbGUsIGN0eC0+cG9zLCBidWZzaXplLCBGVVNFX1JFQURESVIpOwogCX0KIAls
b2NrZWQgPSBmdXNlX2xvY2tfaW5vZGUoaW5vZGUpOwotCXJlcyA9IGZ1c2Vfc2ltcGxlX3JlcXVl
c3QoZm0sICZhcC0+YXJncyk7CisJcmVzID0gZnVzZV9zaW1wbGVfcmVxdWVzdChmbSwgYXJncyk7
CiAJZnVzZV91bmxvY2tfaW5vZGUoaW5vZGUsIGxvY2tlZCk7CiAJaWYgKHJlcyA+PSAwKSB7CiAJ
CWlmICghcmVzKSB7CkBAIC0zNjksMTYgKzM2NSwxNCBAQCBzdGF0aWMgaW50IGZ1c2VfcmVhZGRp
cl91bmNhY2hlZChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGRpcl9jb250ZXh0ICpjdHgpCiAJ
CQlpZiAoZmYtPm9wZW5fZmxhZ3MgJiBGT1BFTl9DQUNIRV9ESVIpCiAJCQkJZnVzZV9yZWFkZGly
X2NhY2hlX2VuZChmaWxlLCBjdHgtPnBvcyk7CiAJCX0gZWxzZSBpZiAocGx1cykgewotCQkJcmVz
ID0gcGFyc2VfZGlycGx1c2ZpbGUoZm9saW9fYWRkcmVzcyhmb2xpbyksIHJlcywKLQkJCQkJCWZp
bGUsIGN0eCwgYXR0cl92ZXJzaW9uLAorCQkJcmVzID0gcGFyc2VfZGlycGx1c2ZpbGUoYnVmLCBy
ZXMsIGZpbGUsIGN0eCwgYXR0cl92ZXJzaW9uLAogCQkJCQkJZXZpY3RfY3RyKTsKIAkJfSBlbHNl
IHsKLQkJCXJlcyA9IHBhcnNlX2RpcmZpbGUoZm9saW9fYWRkcmVzcyhmb2xpbyksIHJlcywgZmls
ZSwKLQkJCQkJICAgIGN0eCk7CisJCQlyZXMgPSBwYXJzZV9kaXJmaWxlKGJ1ZiwgcmVzLCBmaWxl
LCBjdHgpOwogCQl9CiAJfQogCi0JZm9saW9fcHV0KGZvbGlvKTsKKwlrdmZyZWUoYnVmKTsKIAlm
dXNlX2ludmFsaWRhdGVfYXRpbWUoaW5vZGUpOwogCXJldHVybiByZXM7CiB9Cg==
--0000000000009a16360631b941a6--
