Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F08A21B918
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718602; cv=none; b=JprToXg1hJK2NIct7Tw6RPkmSDC4FAZxjuKoAJdw9ejCwebRRmpBxKSS0qt4zLiHv5sdEj+vQdTxhCROMmQadMQTRjgAFzSQ2u87mDM58VnK6HwKx3DY3FSGisYyH4pXy1T6dv1/O45zv9mS/4e2rxIYel8dZkCwSG3SMLjagoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718602; c=relaxed/simple;
	bh=OXO9Ksx6UGvju2TD4wjBJsg6mvgy3QZrrLoi3fnzs0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGyvAv2XRz5yc6C/5OwIR4YV89Cjds0bCMoVZwQ9oKBzY7Q2dfaB8GdB/XKH2Spxre9G7K2Gu3n3hiJgQ8parVuZjakKa1OiIcqR4JLJGqQjsekmHr++XdqzKMU7CN4Hkih+XIoZWcY/mMZN8DCtWw/PlQGP1m5+DnDIXVQpFN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=fibZEYV2; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="fibZEYV2"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a42cb03673so9844861cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749718598; x=1750323398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OXO9Ksx6UGvju2TD4wjBJsg6mvgy3QZrrLoi3fnzs0M=;
        b=fibZEYV29jFSNqzXfqDAouKqW3q+/+eFFjkQLT5Wn2hlCs0NDQMk3hpWBlfhMOvhSz
         Y00DDg1bB0udSJ/p0eI4Sm7CZDgmW3BGuQhhpqKUfJqLjj5YDM1Ui9D1AQ/VmJVGfSEc
         ex17z+m0Lsq5IV6PvG7avnqHSFzjXpWFtcYd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749718598; x=1750323398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXO9Ksx6UGvju2TD4wjBJsg6mvgy3QZrrLoi3fnzs0M=;
        b=FfFaSGnaXoW0ilXnAD7NBPDNGoRiLiaSobi27j9L+hUJSnXN23gE/fwZ/kNxl8FFeZ
         dKIII46OJd15wKNxlbkqShItyxnwZhiUkL+9sbUT8/RlW0zZZgn60WnA35sdOu6uF3cG
         OSqcWmvSL2aRbBLGxrOL1REGK1bjj4FlH2pKXwpYiejHce1lT/8DWhIM5bEAaBMxHPDD
         A5HingH1edasj/GjcY8aW5owkxOho+WOKurNAvc0wUA53KAS98s2wZU5i6PItV0Yss23
         ue3LUo1naBpTpWRuwk0UqV6++w5UsxFinviBZZrOE5x8F2wEDt1aSLLik7xXgmClhggi
         WrDg==
X-Forwarded-Encrypted: i=1; AJvYcCXWzS1HpFijOLsupD05avyY51cs1muIrkN2RqI7/51VI3MgrdYmwpQ/J6i1hXsu3cC1W8/UVALPkPdv3ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHjZG8CmknYyoxbUajN65rgzt6CrdDwNTt4i2YCnBalIkalqg
	sKTnYtuQ/NwYl77NXRdxrNpFs6UawGKHpKTQGhUfaly8akruEMQOIZuNpO4r3MINRuUCYtYCVq/
	cinuRrqeyoIIksiOL1mRpVD1zzB7iII+0UukAkgf+Cw==
X-Gm-Gg: ASbGncvz3kH/6kN7dnDjwZZ4b8Ztf9fy2UKiER1Jd4OhemZiM95bXYNV/dSQ7mmBmzz
	9wcA1QBr4y5tpYbsP39VZ8KC4CZS6h3locMMTs04+r5a86vbC6G0a/WXhBK5h6tbhHR4SFJwg1T
	CU7NxS6H1eLbsREetZqQElp+9waRxmDo8Hwx2GTzAfIYwM
X-Google-Smtp-Source: AGHT+IGYeO7fVzidztBGxxJplzm+jm0i0+5bLXNJiagXaREvn8LewE0tDyeq+8GDj9n5nD9Pqh7fmUjqjBeek1GEfYc=
X-Received: by 2002:a05:622a:191d:b0:477:6f1e:f477 with SMTP id
 d75a77b69052e-4a713bbf66amr118143031cf.19.1749718598017; Thu, 12 Jun 2025
 01:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610021007.2800329-2-chenlinxuan@uniontech.com>
In-Reply-To: <20250610021007.2800329-2-chenlinxuan@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 12 Jun 2025 10:56:26 +0200
X-Gm-Features: AX0GCFsde1G6EBQoyCCDtWUSQ8g7tbKacMMtsK7I7Ff8_JzJPwy-4V8vuvYrXKI
Message-ID: <CAJfpegt8Hk6nt5+iPg-if9iquWqr3eecgDSKYZvJY0OX+y5b9A@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] selftests: filesystems: Add functional test for
 the abort file in fusectl
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Shuah Khan <shuah@kernel.org>, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Amir Goldstein <amir73il@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000007e07d906375c1ba4"

--0000000000007e07d906375c1ba4
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 04:10, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
>
> This patch add a simple functional test for the "abort" file
> in fusectlfs (/sys/fs/fuse/connections/ID/about).
>
> A simple fuse daemon is added for testing.
>
> Related discussion can be found in the link below.
>
> Link: https://lore.kernel.org/all/CAOQ4uxjKFXOKQxPpxtS6G_nR0tpw95w0GiO68UcWg_OBhmSY=Q@mail.gmail.com/
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Thanks.

I suggest setting up a userns environment, see attached patch (also
fixes a EBUSY on umount/rmdir).

Thanks,
Miklos

--0000000000007e07d906375c1ba4
Content-Type: text/x-patch; charset="US-ASCII"; name="fuse-abort-test-userns.patch"
Content-Disposition: attachment; filename="fuse-abort-test-userns.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mbt58rz80>
X-Attachment-Id: f_mbt58rz80

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2ZpbGVzeXN0ZW1zL2Z1c2UvZnVz
ZWN0bF90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9maWxlc3lzdGVtcy9mdXNlL2Z1
c2VjdGxfdGVzdC5jCmluZGV4IDcwNTBmYmUwOTcwZS4uOGQxMjRkMWNhY2IyIDEwMDY0NAotLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9maWxlc3lzdGVtcy9mdXNlL2Z1c2VjdGxfdGVzdC5j
CisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2ZpbGVzeXN0ZW1zL2Z1c2UvZnVzZWN0bF90
ZXN0LmMKQEAgLTE0LDYgKzE0LDcgQEAKICNpbmNsdWRlIDxzeXMvd2FpdC5oPgogI2luY2x1ZGUg
PHVuaXN0ZC5oPgogI2luY2x1ZGUgPGRpcmVudC5oPgorI2luY2x1ZGUgPHNjaGVkLmg+CiAjaW5j
bHVkZSA8bGludXgvbGltaXRzLmg+CiAKICNpbmNsdWRlICIuLi8uLi9rc2VsZnRlc3RfaGFybmVz
cy5oIgpAQCAtMjMsNiArMjQsMTcgQEAKICNkZWZpbmUgRlVTRV9ERVZJQ0UgIi9kZXYvZnVzZSIK
ICNkZWZpbmUgRlVTRUNUTF9URVNUX1ZBTFVFICIxIgogCitzdGF0aWMgdm9pZCB3cml0ZV9maWxl
KHN0cnVjdCBfX3Rlc3RfbWV0YWRhdGEgKmNvbnN0IF9tZXRhZGF0YSwKKwkJICAgICAgIGNvbnN0
IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIgKnZhbCkKK3sKKwlpbnQgZmQgPSBvcGVuKHBhdGgsIE9f
V1JPTkxZKTsKKwlzaXplX3QgbGVuID0gc3RybGVuKHZhbCk7CisKKwlBU1NFUlRfR0UoZmQsIDAp
OworCUFTU0VSVF9FUSh3cml0ZShmZCwgdmFsLCBsZW4pLCBsZW4pOworCUFTU0VSVF9FUShjbG9z
ZShmZCksIDApOworfQorCiBGSVhUVVJFKGZ1c2VjdGwpewogCWNoYXIgZnVzZV9tb3VudHBvaW50
W3NpemVvZihGVVNFX01PVU5UUE9JTlQpXTsKIAlpbnQgY29ubmVjdGlvbjsKQEAgLTMzLDYgKzQ1
LDE4IEBAIEZJWFRVUkVfU0VUVVAoZnVzZWN0bCkKIAljb25zdCBjaGFyICpmdXNlX21udF9wcm9n
ID0gIi4vZnVzZV9tbnQiOwogCWludCBzdGF0dXMsIHBpZDsKIAlzdHJ1Y3Qgc3RhdCBzdGF0YnVm
OworCXVpZF90IHVpZCA9IGdldHVpZCgpOworCWdpZF90IGdpZCA9IGdldGdpZCgpOworCWNoYXIg
YnVmWzMyXTsKKworCS8qIFNldHVwIHVzZXJucyAqLworCUFTU0VSVF9FUSh1bnNoYXJlKENMT05F
X05FV05TfENMT05FX05FV1VTRVIpLCAwKTsKKwlzcHJpbnRmKGJ1ZiwgIjAgJWQgMSIsIHVpZCk7
CisJd3JpdGVfZmlsZShfbWV0YWRhdGEsICIvcHJvYy9zZWxmL3VpZF9tYXAiLCBidWYpOworCXdy
aXRlX2ZpbGUoX21ldGFkYXRhLCAiL3Byb2Mvc2VsZi9zZXRncm91cHMiLCAiZGVueSIpOworCXNw
cmludGYoYnVmLCAiMCAlZCAxIiwgZ2lkKTsKKwl3cml0ZV9maWxlKF9tZXRhZGF0YSwgIi9wcm9j
L3NlbGYvZ2lkX21hcCIsIGJ1Zik7CisJQVNTRVJUX0VRKG1vdW50KCIiLCAiLyIsIE5VTEwsIE1T
X1JFQ3xNU19QUklWQVRFLCBOVUxMKSwgMCk7CiAKIAlzdHJjcHkoc2VsZi0+ZnVzZV9tb3VudHBv
aW50LCBGVVNFX01PVU5UUE9JTlQpOwogCkBAIC03Myw3ICs5Nyw3IEBAIEZJWFRVUkVfU0VUVVAo
ZnVzZWN0bCkKIAogRklYVFVSRV9URUFSRE9XTihmdXNlY3RsKQogewotCXVtb3VudChzZWxmLT5m
dXNlX21vdW50cG9pbnQpOworCXVtb3VudDIoc2VsZi0+ZnVzZV9tb3VudHBvaW50LCBNTlRfREVU
QUNIKTsKIAlybWRpcihzZWxmLT5mdXNlX21vdW50cG9pbnQpOwogfQogCg==
--0000000000007e07d906375c1ba4--
