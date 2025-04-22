Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C51ACEC7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745355003; cv=none; b=X98sG/BI9h07rzwyDN3uFVkvhYZY+is3s1VHsEFq13lcZsBf+ony+rgOy2fLgrhNa2QUfO8wN57BYNi/4lVf0VU3xYxA5BEdGNLVE6nODAhNXWvORdq/Q7OD+n4XZDcVnd0B6CySfj5EousuMIu0S9QxKTsxgbcdZTnHMjC91Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745355003; c=relaxed/simple;
	bh=tq11VXuGK4G076cwsssULAGWFP4LI4Ru1bEvQpkX+Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7JcPnnAVlv96xypdl/8UsAnh0lZzE8hS+F5/ZOBKtujCI7t6HqCvNRWbHA0zCRaPDQQEraPXZQ7QYQLgdX251bp+hWQrxVvBTIi1Kv4efvcD3RNDkavMydadwMG4VVxWwfKnBuCPhCE9Y91RwxOw+vFEoEYoTf+9CugiuuUmzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GVzv7HIw; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GVzv7HIw"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25520a289so745332766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745354998; x=1745959798; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4FWTDkomkXSOBV/XGBWUMIf5NiQnIJYvdg+R5LOeElQ=;
        b=GVzv7HIwDK2Ve14Ck8z4sHyTbEMafrt0YT9nxur6bhhKxFGvoFrZgXQFPXjUo5eGDW
         qSCFVXtE26+sBuP+Jdr8elXEQPqrjYYztHQ5Ljc6car1Pds+AQQ3cbUOHQiv4bMzuDIs
         K4fyB4c4TyyfuxnlYXnarmw2rNAt/O4TzZHt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745354998; x=1745959798;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FWTDkomkXSOBV/XGBWUMIf5NiQnIJYvdg+R5LOeElQ=;
        b=Rsv0iNSKHEkeRlac9RE8mxLlXYXTEEZ6ys3tEaTG4rl2BkhLkjvdjAkGmY2O/O66rj
         XcjReIKF1qxVTDp92MX297yEFWxJ8P7DJBBJ57IzpTKxJu5qpyzRea9lMbZ3vt4yfaFe
         H9N3WqsAioFkIH9nSoUmWD8wF6yY7IV9TMu/wrPnN8NV6mQi6HCJ1dOZlXN/Qqyi1DEL
         u0XvlhgFmhqNRLPNWna2NuAHv+0BTHLDwwwi0NwSUYKLdtleS7sbsEzX3jCG+vATREJb
         TFbthS33im41Ay0g7SXBQF5hRueit1k9Aa+GyDbITihVyg3D0JZSiat/Zk9cByaHet0C
         LhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSFPk345s7kOxMti0Lbjxwg2Z3COSw4tslCVGcehEsIjfNgzUkTffBfpBnYkboITtRVrZuTeNnK1tVBJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnFMHlAxlu+BnRnmV1Gw1uQkRPJIfRl75uwx8WeosFTrXWcq2
	uQZpAwVp01nSoIp8drU63w455XAXm1Uqahbr6LJQA2ae8fjzQWsRlY7svchEVlbIuIkkHc4NNG9
	yrn0=
X-Gm-Gg: ASbGncsYmXqPDW8bfZr3y3VdiRsRGmEkOJ/y9v4EaWoc+MHtkQDxEAzKPV/1qhZcfpG
	C7Gnlw13RXuxDXnlABOa28cYSxfNPgCWLnqyd/ym/1EclJimxgXZ8FcB+09/P05EJb4GJfYn7PG
	HsQN8jL9DJKTQ5tCpgdK+KP4GPUwVWsYVxPdpbg1PWeD/pI6H8od44VPezkgB8Biq19P6Y/4HY8
	txn3rLuv7dCkri7syei6DOxZ4Z90e1X0gr3viBSrGXyYtchGTKHOfDRwLPJ1OT6tnz6AuureigC
	jmq4vW3qfrSNFiQF5p5h0Mw7Pby0ZiQQvyhchht2Bg12kVyOsBEQLjrZfgix6t5G3SFnLIeZEi0
	+O4siHRlHo/4In5A=
X-Google-Smtp-Source: AGHT+IHE4CqfuTF82B9baxAc3syUy+MTCzX7m/O/69azfkc1RLiD/EBw/RmhGKd6RLdA4vQ/5kmrDA==
X-Received: by 2002:a17:907:743:b0:aca:cac7:28e2 with SMTP id a640c23a62f3a-acb74d8310bmr1556145366b.40.1745354997781;
        Tue, 22 Apr 2025 13:49:57 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec51601sm705801466b.74.2025.04.22.13.49.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:49:56 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so9314923a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:49:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMJGKDKk8c8iwB60E7cato/xUdI66bans3Ey1lgRC9JiD4tAgkowX4Gef3QRd/Wh/F9NWFHNxmjsvJEGY=@vger.kernel.org
X-Received: by 2002:a17:907:743:b0:aca:cac7:28e2 with SMTP id
 a640c23a62f3a-acb74d8310bmr1556140366b.40.1745354996549; Tue, 22 Apr 2025
 13:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422204718.0b4e3f81@canb.auug.org.au> <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
 <54c5930c-4006-4af9-8870-5d887bae7ac1@t-8ch.de> <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
In-Reply-To: <CAHk-=whv79F+zTKPa3yygTWnC+z9gRtPOdj_aBegWXtWB3D9=A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Apr 2025 13:49:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiWeE8jU9d_aMbeczuDxWzkoks38ALLfv44xSiiv7DQyA@mail.gmail.com>
X-Gm-Features: ATxdqUGHYynWmKNIpL2uvXGI5h4GrqDjj-l3DfiA1avpodNwGhrFkOwAVinoFoY
Message-ID: <CAHk-=wiWeE8jU9d_aMbeczuDxWzkoks38ALLfv44xSiiv7DQyA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of Linus' tree
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000093d845063364203d"

--00000000000093d845063364203d
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 11:20, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Heh. We have several other cases of that "disable warning" pattern
> that does *not* use that cc-disable-warning thing.

Bah. I did the obvious sed-script to fix this up, and the result just
feels oh-so-wrong.

It feels so wrong because the CC_NO_STRINGOP_OVERFLOW case in the main
Makefile goes from having

 ... += $(call cc-option, -Wno-stringop-overflow)

to having the (obviously fixed)

 ... += $(call cc-disable-warning, stringop-overflow)

and the patch is clearly *right*.

But the "feels wrong" part is because the very next  (unchanged) line
in the patch is then using

 ... += $(call cc-option, -Wstringop-overflow)

for the CC_STRINGOP_OVERFLOW case.

So that patch (full patch attached if somebody wants to see it) really
makes it obvious just how unbalanced that cc-option vs
cc-disable-warning thing is.

No wonder we had this pattern wrong in several places, in other words.

              Linus

--00000000000093d845063364203d
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m9sz8ut00>
X-Attachment-Id: f_m9sz8ut00

IE1ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogYXJjaC9sb29uZ2FyY2gv
a2VybmVsL01ha2VmaWxlIHwgOCArKysrLS0tLQogYXJjaC9sb29uZ2FyY2gva3ZtL01ha2VmaWxl
ICAgIHwgMiArLQogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgIHwgNCArKy0tCiA0IGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IGU5NGJiYjIyOThjOC4uMDdmODE4MTg2MTUxIDEw
MDY0NAotLS0gYS9NYWtlZmlsZQorKysgYi9NYWtlZmlsZQpAQCAtMTA1MywxMSArMTA1MywxMSBA
QCBOT1NURElOQ19GTEFHUyArPSAtbm9zdGRpbmMKIEtCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGNj
LW9wdGlvbiwgLWZzdHJpY3QtZmxleC1hcnJheXM9MykKIAogI0N1cnJlbnRseSwgZGlzYWJsZSAt
V3N0cmluZ29wLW92ZXJmbG93IGZvciBHQ0MgMTEsIGdsb2JhbGx5LgotS0JVSUxEX0NGTEFHUy0k
KENPTkZJR19DQ19OT19TVFJJTkdPUF9PVkVSRkxPVykgKz0gJChjYWxsIGNjLW9wdGlvbiwgLVdu
by1zdHJpbmdvcC1vdmVyZmxvdykKK0tCVUlMRF9DRkxBR1MtJChDT05GSUdfQ0NfTk9fU1RSSU5H
T1BfT1ZFUkZMT1cpICs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsIHN0cmluZ29wLW92ZXJm
bG93KQogS0JVSUxEX0NGTEFHUy0kKENPTkZJR19DQ19TVFJJTkdPUF9PVkVSRkxPVykgKz0gJChj
YWxsIGNjLW9wdGlvbiwgLVdzdHJpbmdvcC1vdmVyZmxvdykKIAogI0N1cnJlbnRseSwgZGlzYWJs
ZSAtV3VudGVybWluYXRlZC1zdHJpbmctaW5pdGlhbGl6YXRpb24gYXMgYnJva2VuCi1LQlVJTERf
Q0ZMQUdTICs9ICQoY2FsbCBjYy1vcHRpb24sIC1Xbm8tdW50ZXJtaW5hdGVkLXN0cmluZy1pbml0
aWFsaXphdGlvbikKK0tCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZywg
dW50ZXJtaW5hdGVkLXN0cmluZy1pbml0aWFsaXphdGlvbikKIAogIyBkaXNhYmxlIGludmFsaWQg
ImNhbid0IHdyYXAiIG9wdGltaXphdGlvbnMgZm9yIHNpZ25lZCAvIHBvaW50ZXJzCiBLQlVJTERf
Q0ZMQUdTCSs9IC1mbm8tc3RyaWN0LW92ZXJmbG93CmRpZmYgLS1naXQgYS9hcmNoL2xvb25nYXJj
aC9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvTWFrZWZpbGUKaW5kZXgg
NDg1M2U4YjA0YzZmLi44NGIxZDhiMzZhNDcgMTAwNjQ0Ci0tLSBhL2FyY2gvbG9vbmdhcmNoL2tl
cm5lbC9NYWtlZmlsZQorKysgYi9hcmNoL2xvb25nYXJjaC9rZXJuZWwvTWFrZWZpbGUKQEAgLTIx
LDEwICsyMSwxMCBAQCBvYmotJChDT05GSUdfQ1BVX0hBU19MQlQpCSs9IGxidC5vCiAKIG9iai0k
KENPTkZJR19BUkNIX1NUUklDVF9BTElHTikJKz0gdW5hbGlnbmVkLm8KIAotQ0ZMQUdTX21vZHVs
ZS5vCQkrPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCi1DRkxBR1Nfc3lz
Y2FsbC5vCSs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKLUNGTEFHU190
cmFwcy5vCQkrPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCi1DRkxBR1Nf
cGVyZl9ldmVudC5vCSs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKK0NG
TEFHU19tb2R1bGUubwkJKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZyxvdmVycmlkZS1pbml0
LCkKK0NGTEFHU19zeXNjYWxsLm8JKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZyxvdmVycmlk
ZS1pbml0LCkKK0NGTEFHU190cmFwcy5vCQkrPSAkKGNhbGwgY2MtZGlzYWJsZS13YXJuaW5nLG92
ZXJyaWRlLWluaXQsKQorQ0ZMQUdTX3BlcmZfZXZlbnQubwkrPSAkKGNhbGwgY2MtZGlzYWJsZS13
YXJuaW5nLG92ZXJyaWRlLWluaXQsKQogCiBpZmRlZiBDT05GSUdfRlVOQ1RJT05fVFJBQ0VSCiAg
IGlmbmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0UKZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNo
L2t2bS9NYWtlZmlsZSBiL2FyY2gvbG9vbmdhcmNoL2t2bS9NYWtlZmlsZQppbmRleCBmNGM4ZTM1
YzIxNmEuLmUzZjAyMjU2MDJmZiAxMDA2NDQKLS0tIGEvYXJjaC9sb29uZ2FyY2gva3ZtL01ha2Vm
aWxlCisrKyBiL2FyY2gvbG9vbmdhcmNoL2t2bS9NYWtlZmlsZQpAQCAtMjEsNCArMjEsNCBAQCBr
dm0teSArPSBpbnRjL2Vpb2ludGMubwoga3ZtLXkgKz0gaW50Yy9wY2hfcGljLm8KIGt2bS15ICs9
IGlycWZkLm8KIAotQ0ZMQUdTX2V4aXQubwkrPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJp
ZGUtaW5pdCwpCitDRkxBR1NfZXhpdC5vCSs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsb3Zl
cnJpZGUtaW5pdCwpCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBiL2Fy
Y2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCmluZGV4IDhkMTg2YmZjZWQ0NS4uYzZmOWI0MTkzNTlj
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9NYWtlZmlsZQpAQCAtOSw4ICs5LDggQEAgQ0ZMQUdTX1JFTU9WRV9wYXRjaC5vCT0g
JChDQ19GTEFHU19GVFJBQ0UpCiBDRkxBR1NfUkVNT1ZFX3NiaS5vCT0gJChDQ19GTEFHU19GVFJB
Q0UpCiBDRkxBR1NfUkVNT1ZFX3JldHVybl9hZGRyZXNzLm8JPSAkKENDX0ZMQUdTX0ZUUkFDRSkK
IGVuZGlmCi1DRkxBR1Nfc3lzY2FsbF90YWJsZS5vCSs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1v
dmVycmlkZS1pbml0LCkKLUNGTEFHU19jb21wYXRfc3lzY2FsbF90YWJsZS5vICs9ICQoY2FsbCBj
Yy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKK0NGTEFHU19zeXNjYWxsX3RhYmxlLm8JKz0g
JChjYWxsIGNjLWRpc2FibGUtd2FybmluZyxvdmVycmlkZS1pbml0LCkKK0NGTEFHU19jb21wYXRf
c3lzY2FsbF90YWJsZS5vICs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcsb3ZlcnJpZGUtaW5p
dCwpCiAKIGlmZGVmIENPTkZJR19LRVhFQ19DT1JFCiBBRkxBR1Nfa2V4ZWNfcmVsb2NhdGUubyA6
PSAtbWNtb2RlbD1tZWRhbnkgJChjYWxsIGNjLW9wdGlvbiwtbW5vLXJlbGF4KQo=
--00000000000093d845063364203d--
