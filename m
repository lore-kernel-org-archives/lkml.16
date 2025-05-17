Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642523DE
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499683; cv=none; b=sfa1OXYb+aeFrRZnTvbroaTKqVUK3dtG6DZlykI79xsh6lSq3OBZYLSMPfNo4j/bVr45ZeiDKWJXDFYC/3QR/PB4n5CuGpjfKyvHv2aj5gHtge6FpoCl1bFEdWa+G9RJyG5/pLBbL7sL5EzOBRwFeuSELXCJBnr8+e3PC6nYm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499683; c=relaxed/simple;
	bh=cxIS06sQdiCIY2bJQpkGWiCOcRla0cyXb2S51bjfHMM=;
	h=Date:From:Subject:To:Cc:Message-Id:MIME-Version:Content-Type; b=PwxML7IvuZlwibfZXpGLp/8JCPNnjqkIWHMv3MG7JuweFcd3FnzPoMXhm8xBGQOqK3ewX50Kg3IOvJwlIvXm188CxWv7pjYA6SwP41T79FEg9da8ugQISIG2OwQP2HfotGSIwK1L8PNXyhRlVxv83R2sH1EPzRkwVG+3q683mxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net; spf=pass smtp.mailfrom=unrealasia.net; dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b=Z3Ewb6Uz; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unrealasia.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unrealasia-net.20230601.gappssmtp.com header.i=@unrealasia-net.20230601.gappssmtp.com header.b="Z3Ewb6Uz"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30ecc762cb7so122635a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unrealasia-net.20230601.gappssmtp.com; s=20230601; t=1747499680; x=1748104480; darn=vger.kernel.org;
        h=mime-version:message-id:cc:to:subject:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3t+g2Wqv+nCj54sfOkJS9FBf4pbqJZh+ggqonAQt+Ao=;
        b=Z3Ewb6Uz0c6pB25JhH5jYMEqO48uVXjHzmBPdPhuAeJVtUszznjO2VA3d1NklKjxpO
         EOpgZ3LmEyFh1/M2b1erPFNiUizsx9lC42UtQLfS871ks8SsqZqDz/2KyvBInnQ7fbQm
         4l2pGaTY/l03Xx7Yi5ezTtLb84kSpQ+AuNmZvIiCIc8ATl9Iq6RpMt/TsYgkhOb+n6iH
         bH+nsI0wfYgGC+jm46+x/ndNUO88M6pt/aYW8ESHI5LJklnwHB5GN26ewEZU7d8yMKgV
         YQx5mwaVXxR5LwJfrtKkb69s5q4gZpy2MIFPe+6SQRVW7GzXdLZkoraYqZ22QWBceygV
         +4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747499680; x=1748104480;
        h=mime-version:message-id:cc:to:subject:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3t+g2Wqv+nCj54sfOkJS9FBf4pbqJZh+ggqonAQt+Ao=;
        b=xIB6x18hJiZ44wsxpX+ErAxuVkhb9X8kaIskyDrln/2tm6jdpG+ICk+Qp6v8HSp8Il
         4nwJ2AYKC4IUgjz9F2erKidZK+VmwZ9qahz/6vRMePGKhdWwFoRZSF6KNk2QZhpUD34+
         5oZVjut76q6937BY6zaGBOzoSPqrs+URuBP1RcaM8GCKNCXnvxwmX1GsPJJiv1MbPZVk
         6oaDCOjaOxfM+eafYYOXyWNCCIjy7gEwDzWHYNAJOc59PsrsOfVaxTffwP2vY+jJdmFF
         RqqIlqeRCdT1nFvUBofADAn2HxdmymPkpVNVlLZ+xR1Utxe3SdZgcTIr1i+na0DXku58
         21Kg==
X-Gm-Message-State: AOJu0YzCC63hyJhKsKq1UhHmUdPLOj/eZmExWfePFze7Dcet4Y7J8MIl
	z8ei93K1dSVU6gq1nY6gWnTmC1EzrYS/lVFTvBZBoeo8wMma1wm3HkA/I+AbmT/vOSc56l6tT77
	PrZnt
X-Gm-Gg: ASbGncvIdRYfh28chQOxfFlV62nPauWUbVte8KgH3BXCtBurtOdZK1w4pwqUALH+gYF
	pgAhnamCAJnsPyLKPGD5zXjv48PoP6CAqYbciUKALu5GN8//10umV2Is6bMQ3cT7HPR/v6cmfqh
	3aCcFfF8k01ZckekHGQ/qFemnvVAdI5q0sKIQDBR/1beTX9LMCkoa+FI6RRXuLr9PUDIX6XaVgT
	AjhIuRTZSZUBLzSo+9NyKzSeqVO4AL1S9ZBnTd2GGMSr6qKAWZD2Y7DMTyNbjmuNAZ7h4dnNm59
	jx/tT0KUJEDreccD6jqoK0atR5hb1i3x8qhMHA+LHWJRLfVWM5bx0oDqSb7BLD0F
X-Google-Smtp-Source: AGHT+IEUyDuf8c8l/mmCIZmxabJIhypEysBe86kJuxy6Bb5IuP+dePAQgDQR5TJbh4bh4UZLSpEzTA==
X-Received: by 2002:a17:90b:2d50:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-30e4dbb700bmr16505665a91.14.1747499679683;
        Sat, 17 May 2025 09:34:39 -0700 (PDT)
Received: from muhammads-ThinkPad ([2402:1980:245:6ef:bd3e:6a19:ff75:ab35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26f55ee652sm2341100a12.53.2025.05.17.09.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 09:34:38 -0700 (PDT)
Date: Sun, 18 May 2025 00:34:24 +0800
From: Muhammad Nuzaihan <zaihan@unrealasia.net>
Subject: PATCH v2 [1/1]: MPTCP support for Git on Linux
To: linux-kernel@vger.kernel.org
Cc: "phillip.wood" <phillip.wood@dunelm.org.uk>, "brian m. carlson"
	<sandals@crustytoothpaste.net>
Message-Id: <CDZEWS.Q5FBCC7YC2QD2@unrealasia.net>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-cQwyj68cVqslCqkXfM2s"

--=-cQwyj68cVqslCqkXfM2s
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi,

This patch is about Multi-Path TCP.

Multi-Path TCP (MPTCP) had been in development for the past 15 years
which started with MPTCP v0 (version 0) which initially had issues
for middleboxes and NAT Gateways.

The current iteration is MPTCP v1 which has a fallback mechanism to 
regular
TCP to avoid issues with middleboxes and NAT Gateways.

Started to add this code change as a need as i have large git codebases
with around 50 gigabytes and i have multiple WAN links  which i can 
aggregate
bandwidth across and even when  network one path (even in between my 
CPE router
to internet) is down, i will not get interrupted.

Also i am using a Linux laptop that has WiFi and 5G module. So this kind
of adds my reason of adding support for git (on Linux)

To get MPTCP to be fully working, both ends of client and server must 
implement
MPTCP.

My implementation adds support for the basic git protocol.

MPTCP helps in situations when one of my WAN links have a high latency 
and
automatically choose a link with a path with less latency.

Also, MPTCP aggregates the MPTCP connection by using subflows where two 
or more
links can be utilised with subflows. A single flow of data can have 
multiple
subflows across different IP interfaces and thus increases network
throughput.

Apple for example had been using MPTCP for their cloud services since 
MPTCP v0
which had issues with middleboxes (not MPTCP v1) since 2013.

The downside, even though i had never experienced it for other 
applications
on Linux like Google Chromium[1], is that the fallback might induce 
delays
in connectivity, if i've read it somewhere which i cannot recall where.

How this patch works:

This patch enables MPTCP protocol option only when it's built on Linux 
with
IPPROTO_MPTCP support in netinet/in.h.

On Linux, if IPPROTO_MPTCP is not defined in netinet/in.h, it will 
skipped.

IPPROTO_MPTCP should and never be enabled when it detects being built on
an OS other than Linux with defined(__linux__) check.

Another challenge is that although "getaddrinfo()" is a POSIX function,
not all glibc "getaddrinfo()" implementation is written with
IPPROTO_MPTCP support out of the box, especially on older glibc 
versions.

getaddrinfo() IPPROTO_MPTCP support had only been added to recent glibc
in 2025 eventhough IPPROTO_MPTCP definition had been around for
much longer in netinet/in.h.

So we run getaddrinfo() which is a code in glibc and check for errors,
specifically "EAI_SOCKTYPE" return value which tells us that the socket 
type
is not supported and fallback to regular TCP (IPPROTO_TCP)

Also we will also check that we are building on Linux and depending on
version number of Linux we will initialize the socket() accordingly and 
if
there is an error return value (like 
EINVAL/EPROTONOSUPPORT/ENOPROTOOPT),
we will fall back to regular TCP.

Enabling and disabling MPTCP:

By default on the client side, MPTCP will not be enabled in git client, 
however MPTCP
can be enabled by setting an environment variable "GIT_ENABLE_MPTCP" to
any value.

Persisting the configuration can be done in your shell.

Also for server side git server (daemon.c), there is a flag to 
optionally
enable mptcp with "--mptcp", example:

git-daemon --base-path=/all/my/repos --export-all --mptcp

This will tell the git server daemon to accept mptcp connections but
fallback to regular tcp when mptcp connection is not available.

PS: Can someone point me about having a "knob" in Makefile or is this
already sufficient?

[1] https://chromium-review.googlesource.com/c/chromium/src/+/6355767

Signed-off-by: Muhammad Nuzaihan Bin Kamal Luddin 
<zaihan@unrealasia.net>



--=-cQwyj68cVqslCqkXfM2s
Content-Type: text/x-patch
Content-Disposition: attachment; filename=git-mptcp-v2.diff
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2Nvbm5lY3QuYyBiL2Nvbm5lY3QuYwppbmRleCAzMjgwNDM1MzMxLi44NDZm
YTMxODUzIDEwMDY0NAotLS0gYS9jb25uZWN0LmMKKysrIGIvY29ubmVjdC5jCkBAIC0yMyw2ICsy
Myw5IEBACiAjaW5jbHVkZSAiYWxpYXMuaCIKICNpbmNsdWRlICJidW5kbGUtdXJpLmgiCiAjaW5j
bHVkZSAicHJvbWlzb3ItcmVtb3RlLmgiCisjaWZkZWYgX19saW51eF9fCisjaW5jbHVkZSA8bGlu
dXgvdmVyc2lvbi5oPgorI2VuZGlmCiAKIHN0YXRpYyBjaGFyICpzZXJ2ZXJfY2FwYWJpbGl0aWVz
X3YxOwogc3RhdGljIHN0cnVjdCBzdHJ2ZWMgc2VydmVyX2NhcGFiaWxpdGllc192MiA9IFNUUlZF
Q19JTklUOwpAQCAtNzkzLDYgKzc5NiwxNiBAQCBzdGF0aWMgdm9pZCBlbmFibGVfa2VlcGFsaXZl
KGludCBzb2NrZmQpCiAJCWVycm9yX2Vycm5vKF8oInVuYWJsZSB0byBzZXQgU09fS0VFUEFMSVZF
IG9uIHNvY2tldCIpKTsKIH0KIAorc3RhdGljIGNvbnN0IGNoYXIgKmdpdF9lbmFibGVfbXB0Y3Ao
dm9pZCkKK3sKKyAgICAgICAgY29uc3QgY2hhciAqbXB0Y3A7CisKKyAgICAgICAgaWYgKChtcHRj
cCA9IGdldGVudigiR0lUX0VOQUJMRV9NUFRDUCIpKSkKKyAgICAgICAgICAgICAgICByZXR1cm4g
bXB0Y3A7CisKKwlyZXR1cm4gTlVMTDsKK30KKwogI2lmbmRlZiBOT19JUFY2CiAKIHN0YXRpYyBj
b25zdCBjaGFyICphaV9uYW1lKGNvbnN0IHN0cnVjdCBhZGRyaW5mbyAqYWkpCkBAIC04MTYsNiAr
ODI5LDcgQEAgc3RhdGljIGludCBnaXRfdGNwX2Nvbm5lY3Rfc29jayhjaGFyICpob3N0LCBpbnQg
ZmxhZ3MpCiAJc3RydWN0IGFkZHJpbmZvIGhpbnRzLCAqYWkwLCAqYWk7CiAJaW50IGdhaTsKIAlp
bnQgY250ID0gMDsKKwljb25zdCBjaGFyICplbmFibGVfbXB0Y3A7CiAKIAlnZXRfaG9zdF9hbmRf
cG9ydCgmaG9zdCwgJnBvcnQpOwogCWlmICghKnBvcnQpCkBAIC04MjcsMTIgKzg0MSwyOCBAQCBz
dGF0aWMgaW50IGdpdF90Y3BfY29ubmVjdF9zb2NrKGNoYXIgKmhvc3QsIGludCBmbGFncykKIAll
bHNlIGlmIChmbGFncyAmIENPTk5FQ1RfSVBWNikKIAkJaGludHMuYWlfZmFtaWx5ID0gQUZfSU5F
VDY7CiAJaGludHMuYWlfc29ja3R5cGUgPSBTT0NLX1NUUkVBTTsKLQloaW50cy5haV9wcm90b2Nv
bCA9IElQUFJPVE9fVENQOworI2lmIGRlZmluZWQoX19saW51eF9fKSAmJiBkZWZpbmVkKElQUFJP
VE9fTVBUQ1ApCisgICAgICAgIGVuYWJsZV9tcHRjcCA9IGdpdF9lbmFibGVfbXB0Y3AoKTsKKwlp
ZiAoZW5hYmxlX21wdGNwKQorICAgICAgICAgICAgICAgIGhpbnRzLmFpX3Byb3RvY29sID0gSVBQ
Uk9UT19NUFRDUDsKKwllbHNlCisgICAgICAgICAgICAgICAgaGludHMuYWlfcHJvdG9jb2wgPSBJ
UFBST1RPX1RDUDsKKyNlbHNlCisgICAgICAgIGhpbnRzLmFpX3Byb3RvY29sID0gSVBQUk9UT19U
Q1A7CisjZW5kaWYKIAogCWlmIChmbGFncyAmIENPTk5FQ1RfVkVSQk9TRSkKIAkJZnByaW50Zihz
dGRlcnIsIF8oIkxvb2tpbmcgdXAgJXMgLi4uICIpLCBob3N0KTsKIAotCWdhaSA9IGdldGFkZHJp
bmZvKGhvc3QsIHBvcnQsICZoaW50cywgJmFpKTsKKyAgICAgICAgZ2FpID0gZ2V0YWRkcmluZm8o
aG9zdCwgcG9ydCwgJmhpbnRzLCAmYWkpOworICAgICAgICAvLyBJZiBzeXN0ZW0ncyBnbGliYyBn
ZXRhZGRyaW5mbygpIGRvZXMgbm90IGhhdmUKKyAgICAgICAgLy8gSVBQUk9UT19NUFRDUCBhcyBt
ZW1iZXIgdHlwZSBpbiBzdHJ1Y3QgKGxpa2Ugb2xkZXIKKyAgICAgICAgLy8gZ2xpYmMgYW5kIG90
aGVyIGxpYmMpLCB3ZSBmYWxsYmFjayB0byBJUFBST1RPX1RDUAorICAgICAgICBpZiAoZ2FpID09
IEVBSV9TT0NLVFlQRSkgeworICAgICAgICAgICAgICAgIGhpbnRzLmFpX3Byb3RvY29sID0gSVBQ
Uk9UT19UQ1A7CisgICAgICAgICAgICAgICAgZ2FpID0gZ2V0YWRkcmluZm8oaG9zdCwgcG9ydCwg
JmhpbnRzLCAmYWkpOworICAgICAgICB9CisJCiAJaWYgKGdhaSkKIAkJZGllKF8oInVuYWJsZSB0
byBsb29rIHVwICVzIChwb3J0ICVzKSAoJXMpIiksIGhvc3QsIHBvcnQsIGdhaV9zdHJlcnJvcihn
YWkpKTsKIApAQCAtODg5LDYgKzkxOSw3IEBAIHN0YXRpYyBpbnQgZ2l0X3RjcF9jb25uZWN0X3Nv
Y2soY2hhciAqaG9zdCwgaW50IGZsYWdzKQogCWNoYXIgKiphcDsKIAl1bnNpZ25lZCBpbnQgbnBv
cnQ7CiAJaW50IGNudDsKKwljb25zdCBjaGFyICplbmFibGVfbXB0Y3A7CiAKIAlnZXRfaG9zdF9h
bmRfcG9ydCgmaG9zdCwgJnBvcnQpOwogCkBAIC05MTcsNiArOTQ4LDIxIEBAIHN0YXRpYyBpbnQg
Z2l0X3RjcF9jb25uZWN0X3NvY2soY2hhciAqaG9zdCwgaW50IGZsYWdzKQogCQlzYS5zaW5fcG9y
dCA9IGh0b25zKG5wb3J0KTsKIAkJbWVtY3B5KCZzYS5zaW5fYWRkciwgKmFwLCBoZS0+aF9sZW5n
dGgpOwogCisjaWZkZWYgX19saW51eF9fCisJCWVuYWJsZV9tcHRjcCA9IGdpdF9lbmFibGVfbXB0
Y3AoKTsgCisJCWlmIChlbmFibGVfbXB0Y3ApIHsKKyAgICAgICAgICAgICAgICAgICAgICAgIHNv
Y2tmZCA9IHNvY2tldChoZS0+aF9hZGRydHlwZSwgU09DS19TVFJFQU0sIElQUFJPVE9fTVBUQ1Ap
OworI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA+PSBLRVJORUxfVkVSU0lPTig1LDYsMCkKKyAgICAg
ICAgICAgICAgICAgICAgICAgIC8vIE1QVENQIGNoZWNrIHJldHVybiB2YWx1ZSBmb3IgTGludXgg
S2VybmVsID49IDUuNgorICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNvY2tmZCA9PSBFUFJP
VE9OT1NVUFBPUlQgfHwgc29ja2ZkID09IEVOT1BST1RPT1BUKQorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKKyNlbHNlCisgICAgICAgICAgICAgICAgICAgICAgICAv
LyBNUFRDUCBjaGVjayByZXR1cm4gdmFsdWUgZm9yIExpbnV4IEtlcm5lbCA8IDUuNgorICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHNvY2tmZCA9PSBFSU5WQUwgfHwgc29ja2ZkID09IEVOT1BS
T1RPT1BUKQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKKyNlbmRp
ZgorICAgICAgICAgICAgICAgIH0KKyNlbmRpZgogCQlzb2NrZmQgPSBzb2NrZXQoaGUtPmhfYWRk
cnR5cGUsIFNPQ0tfU1RSRUFNLCAwKTsKIAkJaWYgKChzb2NrZmQgPCAwKSB8fAogCQkgICAgY29u
bmVjdChzb2NrZmQsIChzdHJ1Y3Qgc29ja2FkZHIgKikmc2EsIHNpemVvZiBzYSkgPCAwKSB7CmRp
ZmYgLS1naXQgYS9kYWVtb24uYyBiL2RhZW1vbi5jCmluZGV4IGQxYmU2MWZkNTcuLjc5M2Y4YTQy
MTkgMTAwNjQ0Ci0tLSBhL2RhZW1vbi5jCisrKyBiL2RhZW1vbi5jCkBAIC0yNSw2ICsyNSw3IEBA
IHN0YXRpYyBlbnVtIGxvZ19kZXN0aW5hdGlvbiB7CiB9IGxvZ19kZXN0aW5hdGlvbiA9IExPR19E
RVNUSU5BVElPTl9VTlNFVDsKIHN0YXRpYyBpbnQgdmVyYm9zZTsKIHN0YXRpYyBpbnQgcmV1c2Vh
ZGRyOworc3RhdGljIGludCBtcHRjcDsKIHN0YXRpYyBpbnQgaW5mb3JtYXRpdmVfZXJyb3JzOwog
CiBzdGF0aWMgY29uc3QgY2hhciBkYWVtb25fdXNhZ2VbXSA9CkBAIC0zOCw2ICszOSw3IEBAIHN0
YXRpYyBjb25zdCBjaGFyIGRhZW1vbl91c2FnZVtdID0KICIgICAgICAgICAgIFstLWFjY2Vzcy1o
b29rPTxwYXRoPl1cbiIKICIgICAgICAgICAgIFstLWluZXRkIHwgWy0tbGlzdGVuPTxob3N0X29y
X2lwYWRkcj5dIFstLXBvcnQ9PG4+XVxuIgogIiAgICAgICAgICAgICAgICAgICAgICBbLS1kZXRh
Y2hdIFstLXVzZXI9PHVzZXI+IFstLWdyb3VwPTxncm91cD5dXVxuIgorIiAgICAgICAgICAgWy0t
bXB0Y3BdXG4iCiAiICAgICAgICAgICBbLS1sb2ctZGVzdGluYXRpb249KHN0ZGVycnxzeXNsb2d8
bm9uZSldXG4iCiAiICAgICAgICAgICBbPGRpcmVjdG9yeT4uLi5dIjsKIApAQCAtOTc1LDEwICs5
NzcsMjQgQEAgc3RhdGljIGludCBzZXR1cF9uYW1lZF9zb2NrKGNoYXIgKmxpc3Rlbl9hZGRyLCBp
bnQgbGlzdGVuX3BvcnQsIHN0cnVjdCBzb2NrZXRsaXMKIAltZW1zZXQoJmhpbnRzLCAwLCBzaXpl
b2YoaGludHMpKTsKIAloaW50cy5haV9mYW1pbHkgPSBBRl9VTlNQRUM7CiAJaGludHMuYWlfc29j
a3R5cGUgPSBTT0NLX1NUUkVBTTsKLQloaW50cy5haV9wcm90b2NvbCA9IElQUFJPVE9fVENQOwor
I2lmIGRlZmluZWQoX19saW51eF9fKSAmJiBkZWZpbmVkKElQUFJPVE9fTVBUQ1ApCisJaWYgKG1w
dGNwKQorICAgICAgICAgICAgICAgIGhpbnRzLmFpX3Byb3RvY29sID0gSVBQUk9UT19NUFRDUDsK
KyAgICAgICAgZWxzZQorICAgICAgICAgICAgICAgIGhpbnRzLmFpX3Byb3RvY29sID0gSVBQUk9U
T19NUFRDUDsKKyNlbHNlCisgICAgICAgIGhpbnRzLmFpX3Byb3RvY29sID0gSVBQUk9UT19UQ1A7
CisjZW5kaWYKIAloaW50cy5haV9mbGFncyA9IEFJX1BBU1NJVkU7CiAKLQlnYWkgPSBnZXRhZGRy
aW5mbyhsaXN0ZW5fYWRkciwgcGJ1ZiwgJmhpbnRzLCAmYWkwKTsKKyAgICAgICAgZ2FpID0gZ2V0
YWRkcmluZm8obGlzdGVuX2FkZHIsIHBidWYsICZoaW50cywgJmFpMCk7CisgICAgICAgIC8vIElm
IHN5c3RlbSdzIGdsaWJjIGdldGFkZHJpbmZvKCkgZG9lcyBub3QgaGF2ZQorICAgICAgICAvLyBJ
UFBST1RPX01QVENQIGFzIG1lbWJlciB0eXBlIGluIHN0cnVjdCAobGlrZSBvbGRlcgorICAgICAg
ICAvLyBnbGliYyBhbmQgb3RoZXIgbGliYyksIHdlIGZhbGxiYWNrIHRvIElQUFJPVE9fVENQCisg
ICAgICAgIGlmIChnYWkgPT0gRUFJX1NPQ0tUWVBFKSB7CisgICAgICAgICAgICAgICAgaGludHMu
YWlfcHJvdG9jb2wgPSBJUFBST1RPX1RDUDsKKyAgICAgICAgICAgICAgICBnYWkgPSBnZXRhZGRy
aW5mbyhsaXN0ZW5fYWRkciwgcGJ1ZiwgJmhpbnRzLCAmYWkwKTsKKyAgICAgICAgfQogCWlmIChn
YWkpIHsKIAkJbG9nZXJyb3IoImdldGFkZHJpbmZvKCkgZm9yICVzIGZhaWxlZDogJXMiLCBsaXN0
ZW5fYWRkciwgZ2FpX3N0cmVycm9yKGdhaSkpOwogCQlyZXR1cm4gMDsKQEAgLTEzNDIsNiArMTM1
OCwxMCBAQCBpbnQgY21kX21haW4oaW50IGFyZ2MsIGNvbnN0IGNoYXIgKiphcmd2KQogCQkJcmV1
c2VhZGRyID0gMTsKIAkJCWNvbnRpbnVlOwogCQl9CisJCWlmICghc3RyY21wKGFyZywgIi0tbXB0
Y3AiKSkgeworCQkJbXB0Y3AgPSAxOworCQkJY29udGludWU7CisJCX0KIAkJaWYgKCFzdHJjbXAo
YXJnLCAiLS11c2VyLXBhdGgiKSkgewogCQkJdXNlcl9wYXRoID0gIiI7CiAJCQljb250aW51ZTsK


--=-cQwyj68cVqslCqkXfM2s--

