Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52419260592
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459089; cv=none; b=he0Si97bbE0iNWrjfwCK46BA4nl9uaQx1MWE7y6qT0VJsxENYsxntDiz85HNEoQXLMXZVYHi9j/FlQJGXI2WMedSsd1uxtz8wHujjas2jdr2kLzHZKYrGwIwGs4UojaUUNuT3XFfOGwCUFAqxXTUAmSBF58xCcdGl0X1XFYO6Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459089; c=relaxed/simple;
	bh=p95cYsy1m3sOJTvhMCffWg2Hmoam6wfTtZK/LMX7JXI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DZx09VrN10zVj378+pkLAzNK5+FUP4o/XmamsAPO6B1/LjPbq5xl50sUuH1IxIe1bJGDrfMrMeUJS5KA8euXLnKvhVxlLVrES9iRnXDka83/q059e2pWfcwSzwdi31Le3amWGr0YKp9zRDFrp3mluBTTe6ekfcn79ZRavBkPDls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8weik+m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8weik+m"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d7b50815so32843225e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751459085; x=1752063885; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p95cYsy1m3sOJTvhMCffWg2Hmoam6wfTtZK/LMX7JXI=;
        b=T8weik+mnvjSAbD7BcmtjySIwTTmLt6p/YB/TY5nfxTaMOzCfxxVOHxHUwfs6HUjdU
         MCqDlkqKuz0qlbpfuTNt+92T+nUHsXm/+TFOCD4THR//o+f3vaQ/sjPcjORd48cotv3g
         YHkUAPBJ2utT2loitlLcvEWepbv/d8g+chD0Rrn3O+Zs98T0C+GYi0M36bgUkKmTdwGL
         uJoRP1koEOAC3T+gu3Yv7O3kZ7QLPCWjF/C7+/V64mFiaMAJw7r45SgiBCKE3IJ+siqW
         bULHJo+NqIXPTomJKpXXwNMjocgS7Fm8rxVJ1B9BZ/GEovrJfLzBBYfHydrC5jUwVdNS
         ok4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459085; x=1752063885;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p95cYsy1m3sOJTvhMCffWg2Hmoam6wfTtZK/LMX7JXI=;
        b=fTT3swpMQAtpPr1288emh9vFaFU+idXsg1/ImVkTevlbGwLzCPQovn+yH7rb4ZF36T
         Pjpe/CRD57th6vwSGS1mHJhELVMwJS14u38wYyAX+hjgJUunb4ZpmlnwShjyTA6FVjGS
         oKJ4/DwummWZDpDjw2RNVdy7fLmlTBhSCdq0Yf3tlsdhvyR5bpYYjEMkKfszDdGgZ/0+
         5N8r6gf82WXbkzO+39h7YfePfIzEE4yQspMhxVnXwOg8ibQYuwyE1Hz2WCthHP8VXVCk
         WJQBX5Ze2Y8dUDuaqeK4rpsdm3EBTK46r23z8dCFbT0MO3FpWJZRLbif8hBjFDj699NP
         vWUQ==
X-Gm-Message-State: AOJu0Yw1NPGXT1PobeaduIpHOlbHtdKNDgggemh98E2t/okeKNedqP5I
	+aEh3hdEJUc9d9HClnOSc4KVs3Ur/Mj/qSuRI4r4WpyLdy+Oa0Ib8njDQKRGPSA36iU+P3vC0+C
	riJJarJQ+MHGPn1e40KRF3irKmEN7KXAbhBq1Tpo=
X-Gm-Gg: ASbGncvtzcRFUQOH4rucIfxODvQL80gpdk5bP7E7sshfDHX0bvIhHToMchuq9IIFwxH
	opKjmayHKxSfI5ZUs7PMzmzmQkSfPAFZlp7mSMe8O77hwxokcJa5kEAuYQyrbF1RCF1cT+3r8EB
	y1e+itC3bTqlzR/CVVd7wn2q2h09xSutSRs0m6GBfomD89/FqxdZROSL7iMKZJgeRCS3JAMGPZC
	KwHweelQLyjwms=
X-Google-Smtp-Source: AGHT+IH3MTPQHUB+PRX13pP+9gmcJSXUi/ZU9+12B9DjD/t/03HWPUk06LQDayWPbwDwDI0WtotJLWCnEVQsO/OsMxY=
X-Received: by 2002:a05:600c:c16d:b0:43b:ca39:6c7d with SMTP id
 5b1f17b1804b1-454a4ec75a3mr20281165e9.3.1751459084872; Wed, 02 Jul 2025
 05:24:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jake <jakecontactxyz@gmail.com>
Date: Wed, 2 Jul 2025 20:24:32 +0800
X-Gm-Features: Ac12FXzRkuWVRfdU0qy8VMavkqeD-DkSyJryKciXXV-dWH0Kb-MMLNxkBfbCSeM
Message-ID: <CA+XYpCAq24zaDb-mnWqjs3N2SvbXsGLiT1COzWqQJnaKivb1hw@mail.gmail.com>
Subject: [PATCH] vsnprintf: POSIX compliance for return value length
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org
Content-Type: multipart/mixed; boundary="00000000000097d3b70638f15810"

--00000000000097d3b70638f15810
Content-Type: multipart/alternative; boundary="00000000000097d3b60638f1580e"

--00000000000097d3b60638f1580e
Content-Type: text/plain; charset="UTF-8"

Greetings.

The current implementation of vsnprintf() returns the number of characters
actually written to the buffer, which does not comply with the POSIX
specification. POSIX requires vsnprintf() to return the number of characters
it *would* have written, even if that exceeds the buffer size, so callers
can
detect truncation.

This patch adds a `total_len` counter, updates all output paths to increment
it, and returns `total_len` instead of the truncated output count.

Signed-off-by: Jake <jakecontactxyz@gmail.com>

--00000000000097d3b60638f1580e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Greetings.<div dir=3D"auto"><br></div><div dir=3D"auto">T=
he current implementation of vsnprintf() returns the number of characters</=
div><div dir=3D"auto">actually written to the buffer, which does not comply=
 with the POSIX</div><div dir=3D"auto">specification. POSIX requires vsnpri=
ntf() to return the number of characters</div><div dir=3D"auto">it *would* =
have written, even if that exceeds the buffer size, so callers can</div><di=
v dir=3D"auto">detect truncation.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">This patch adds a `total_len` counter, updates all output paths t=
o increment</div><div dir=3D"auto">it, and returns `total_len` instead of t=
he truncated output count.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Signed-off-by: Jake &lt;<a href=3D"mailto:jakecontactxyz@gmail.com">jake=
contactxyz@gmail.com</a>&gt;</div></div>

--00000000000097d3b60638f1580e--
--00000000000097d3b70638f15810
Content-Type: application/zip; name="vsnprintf_patch.zip"
Content-Disposition: attachment; filename="vsnprintf_patch.zip"
Content-Transfer-Encoding: base64
Content-ID: <197cb17e45bef0e86661>
X-Attachment-Id: 197cb17e45bef0e86661

UEsDBBQAAAAAAMti4lqkK4EcaQIAAGkCAAAXAAAAMDAwMC1jb3Zlci1sZXR0ZXIucGF0Y2hGcm9t
OiBKYWtlIDxqYWtlY29udGFjdHh5ekBnbWFpbC5jb20+ClN1YmplY3Q6IFtQQVRDSF0gdnNucHJp
bnRmOiBQT1NJWCBjb21wbGlhbmNlIGZvciByZXR1cm4gdmFsdWUgbGVuZ3RoCgpUaGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiBvZiB2c25wcmludGYoKSByZXR1cm5zIHRoZSBudW1iZXIgb2YgY2hh
cmFjdGVycyBhY3R1YWxseQp3cml0dGVuIHRvIHRoZSBidWZmZXIsIHdoaWNoIGRvZXMgbm90IGNv
bXBseSB3aXRoIHRoZSBQT1NJWCBzcGVjaWZpY2F0aW9uLiBQT1NJWApyZXF1aXJlcyB2c25wcmlu
dGYoKSB0byByZXR1cm4gdGhlIG51bWJlciBvZiBjaGFyYWN0ZXJzIGl0IHdvdWxkIGhhdmUgd3Jp
dHRlbiwKZXZlbiBpZiB0aGF0IGV4Y2VlZHMgdGhlIGJ1ZmZlciBzaXplLCBzbyBjYWxsZXJzIGNh
biBkZXRlY3QgdHJ1bmNhdGlvbi4KClRoaXMgcGF0Y2ggYWRkcyBhICd0b3RhbF9sZW4nIGNvdW50
ZXIsIHVwZGF0ZXMgYWxsIG91dHB1dCBwYXRocyB0byBpbmNyZW1lbnQgaXQsCmFuZCByZXR1cm5z
ICd0b3RhbF9sZW4nIGluc3RlYWQgb2YgdGhlIHRydW5jYXRlZCBvdXRwdXQgY291bnQuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYWtlIDxqYWtlY29udGFjdHh5ekBnbWFpbC5jb20+ClBLAwQUAAAAAADLYuJa
7Js0l9kBAADZAQAAJQAAADAwMDEtdnNucHJpbnRmLXBvc2l4LWNvbXBsaWFuY2UucGF0Y2gtLS0g
YS9saWIvdnNwcmludGYuYworKysgYi9saWIvdnNwcmludGYuYwpAQCAtMzg2LDYgKzM4Niw3IEBA
IGludCB2c25wcmludGYoY2hhciAqYnVmLCBzaXplX3Qgc2l6ZSwgY29uc3QgY2hhciAqZm10X3N0
ciwgdmFfbGlzdCBhcmdzKQogICAgICAgICBzdHJ1Y3QgcHJpbnRmX3NwZWMgc3BlYyA9IHswfTsK
ICAgICAgICAgc3RydWN0IGZtdCBmbXQgPSB7CiAgICAgICAgICAgICAgICAgLnN0ciAgID0gZm10
X3N0ciwKICAgICAgICAgICAgICAgICAuc3RhdGUgPSBGT1JNQVRfU1RBVEVfTk9ORSwKICAgICAg
ICAgfTsKKyAgICAgICAgc2l6ZV90IHRvdGFsX2xlbiA9IDA7CgpAQCBvdXQ6Ci0gICAgICAgcmV0
dXJuIHN0ciAtIGJ1ZjsKKyAgICAgICAvLyBQT1NJWDogcmV0dXJuIG51bWJlciBvZiBjaGFyYWN0
ZXJzIHdlICp3YW50ZWQqIHRvIHdyaXRlLCBldmVuIGlmIHRydW5jYXRlZAorICAgICAgIHJldHVy
biB0b3RhbF9sZW47ClBLAQIUAxQAAAAAAMti4lqkK4EcaQIAAGkCAAAXAAAAAAAAAAAAAACkgQAA
AAAwMDAwLWNvdmVyLWxldHRlci5wYXRjaFBLAQIUAxQAAAAAAMti4lrsmzSX2QEAANkBAAAlAAAA
AAAAAAAAAACkgZ4CAAAwMDAxLXZzbnByaW50Zi1wb3NpeC1jb21wbGlhbmNlLnBhdGNoUEsFBgAA
AAACAAIAmAAAALoEAAAAAA==
--00000000000097d3b70638f15810--
