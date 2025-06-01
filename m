Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5608C2A1CA;
	Sun,  1 Jun 2025 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748794988; cv=none; b=Mk7ALpD6DqgwXklQ6RHnjCN9IFERLFPAH7tuftVT4avtlf0kB4g/+zeFPs2qlvOVeAn6WSnee6eTA4ExfDgkabgP9URpglZ3sfla9tO5FwNoC52KaYIc+PvThPT00J14LaMrdyfjrCMi6BDlO3uGmqMximPOc3RDsfATZTFUZqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748794988; c=relaxed/simple;
	bh=lVsqs6wXq17PO72ht3/5AIVOZ1tktD5T1KZY4ztpY+U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=T3I4oREuQS6fspr7Gujt2l4+f832p9b3yI3ovVkpACEGh3hvt6xjn/JcxplKK00a5xiNNvSSeQazVE6i9ZOY36dmrm1zsKLoto6s71xoPDRZKeYlnb2S1qSuD75q5VEuhyitGNsdXTV+5jQUxmSm/u2ewK3wASyi61ZAC9HR3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3n57Bm4; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3n57Bm4"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-52b2290e292so1161753e0c.3;
        Sun, 01 Jun 2025 09:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748794985; x=1749399785; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UBnfJ3TITTOHtVKsUcPe+wsv//triy6R9P2/vkFu85g=;
        b=B3n57Bm4m9ZnNHUVy36dYvFuE9UcKUVR18OtnrIfpDnQPtrZ3xX79jCx0ZABrUdtpe
         D8vCdBfpOzrviZeGSEulqi/xt8gEMOLOk1/h3iaT+v2jCb0NyEDXuXnoDJPy3ZFzMAYS
         YJ3tfOvexS5eVUCfJRvl57LJUsrecHhFI6z6ZMNavtSta4NDT9FSjVenuIzDttZOxxzb
         fGD+NcHJMIADAzBX4+3E/9IxhK4i5NHxuhcSiutisXI2cQ8FEFGz2j/0nFPvbkLF8sq0
         yEpDR9uFSozrxfYdSN9HadGGvMlAHGVE0sW1KcT8mlFE2HF3hlGiIDZXKgcgOTj9Be+m
         qQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748794985; x=1749399785;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBnfJ3TITTOHtVKsUcPe+wsv//triy6R9P2/vkFu85g=;
        b=SqnEen+scb0hN7v4e3FSxYCvuGNzzoO+mGP0lyTsSZUg3OMfqiXf0fUj3UNTSkazyT
         T+y0w/9I+3XNH8GmiWdr+M1b/JkctMXn+jjIDxzbXxj/EdQmVToqhst0lcMzPAZWjtZ3
         6QD/VI86Mociz+4UocrAbqovco2wpdG129UqwP7b80ALJllxGo+F1l2LrFfYQM9DAmy2
         Wj1lgYoID8tzmpgaCZONxBShWZ7n2BeTf1t5A+F7N3/OZjFBO5dpPBgSqGlu1M4zYYQb
         Q/CJmHkvloZl8khuQMGOn5djAkJUsZirfZRmMNZzYy+bgj8OQXiIP8BLELlLEqFqt6yA
         +MtQ==
X-Gm-Message-State: AOJu0Yx/ZMso/lMD851lenGTpXv19BQ3ihlCxY+KVtRhJN+AIFf3rWpL
	iHjYTCxtPBOEDvDNlKw6TpI850geMQ7ImgV6oR2Z2P1y5LzTmcX3CVZHBSNfXBdfWNoTfimz2td
	CHbgKy00VgwMsHkb+ywrrsOwRPNuXG4BKuppGiAQ=
X-Gm-Gg: ASbGncsJGP05KYYXYtF9wb9D2gq7tcTOXbEZJZR504fs7uue/UQrXwJI2xjnqHTxfYZ
	FdjypPi9oBdXuRk8Bga7iNjWPBCamfFrlMzVAaXTCuaPQQG9NB8xydYlbo6zTDBVpzvM7DdVLRh
	sAua7fqCKW7l9LmPcpFZ9HAOS8R4pOdyWs35WHHRy45gW78r2diud/krvxqa4qKZ7G
X-Google-Smtp-Source: AGHT+IFOeThiE9EJXIBcLsbMynEW3f7IFMCOQlKIvful3Lu8DnqN2+rwH9aQSrQs37NAZM7hBPNj4ZjmMVlZUtMISxo=
X-Received: by 2002:a05:6122:2015:b0:526:7f3:16e0 with SMTP id
 71dfb90a1353d-53084bbec62mr5671573e0c.1.1748794984813; Sun, 01 Jun 2025
 09:23:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: William Raezer <wraezer@gmail.com>
Date: Sun, 1 Jun 2025 12:22:53 -0400
X-Gm-Features: AX0GCFs9lPJocBMHC4CclP6oKcB_DC3LgeKt1S9twTmU3RNM5eazimMiAlbGMVU
Message-ID: <CAKg96b=n1pZi4FUBqe+puUJo9ndRfU8npvo9w6fE6Enshe73Hg@mail.gmail.com>
Subject: [PATCH] Documentation: Add a source tree map overview
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net
Content-Type: multipart/mixed; boundary="000000000000db042c0636850f9d"

--000000000000db042c0636850f9d
Content-Type: multipart/alternative; boundary="000000000000db042c0636850f9b"

--000000000000db042c0636850f9b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

My name is William Raezer, and this is my first contribution to the Linux
kernel. I'm submitting a simple but hopefully helpful addition: a
high-level map of the Linux kernel source tree as a new document in
`Documentation/source-map.rst`.

As someone beginning to explore the internals of the Linux kernel, I
noticed that while there is some documentation available that describes the
subsystems in principle, there's no centralized overview of the source tree
structure itself. This patch adds a basic source map that describes the
role of each top-level directory in the kernel source.

The goal is to assist both myself and others in navigating the codebase,
especially new contributors who may be overwhelmed by the kernel's size and
complexity. As a follow-up, I plan to add subsystem-level maps for key
directories such as `kernel/`, `mm/`, and `fs/`.

I hope this addition is seen as a positive and useful step, and I=E2=80=99m=
 open to
feedback or suggestions to improve it.

Best regards,
William Raezer
wraezer@gmail.com

Signed-off-by: William Raezer <wraezer@gmail.com>

--=20
"If you don't have something nice to say, at least be creative."
--Madilyn Bailey

--000000000000db042c0636850f9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br><br>My name is William Raezer, and this is =
my first contribution to the Linux kernel. I&#39;m submitting a simple but =
hopefully helpful addition: a high-level map of the Linux kernel source tre=
e as a new document in `Documentation/source-map.rst`.<br><br>As someone be=
ginning to explore the internals of the Linux kernel, I noticed that while =
there is some documentation available that describes the subsystems in prin=
ciple, there&#39;s no centralized overview of the source tree structure its=
elf. This patch adds a basic source map that describes the role of each top=
-level directory in the kernel source.<br><br>The goal is to assist both my=
self and others in navigating the codebase, especially new contributors who=
 may be overwhelmed by the kernel&#39;s size and complexity. As a follow-up=
, I plan to add subsystem-level maps for key directories such as `kernel/`,=
 `mm/`, and `fs/`.<br><br>I hope this addition is seen as a positive and us=
eful step, and I=E2=80=99m open to feedback or suggestions to improve it.<b=
r><br>Best regards, =C2=A0<br>William Raezer =C2=A0<br><a href=3D"mailto:wr=
aezer@gmail.com">wraezer@gmail.com</a><br><br>Signed-off-by: William Raezer=
 &lt;<a href=3D"mailto:wraezer@gmail.com">wraezer@gmail.com</a>&gt;<br></di=
v><br><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">&quot;If you don&#39;t have something nice to say, at least be creative=
.&quot;<div>--Madilyn Bailey<br><div><br></div></div></div></div></div>

--000000000000db042c0636850f9b--
--000000000000db042c0636850f9d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Documentation-Add-a-source-tree-map-overview.patch"
Content-Disposition: attachment; 
	filename="0001-Documentation-Add-a-source-tree-map-overview.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mbdvctzu0>
X-Attachment-Id: f_mbdvctzu0

RnJvbTogV2lsbGlhbSBSYWV6ZXIgPHdyYWV6ZXJAZ21haWwuY29tPgpTdWJqZWN0OiBbUEFUQ0hd
IERvY3VtZW50YXRpb246IEFkZCBhIHNvdXJjZSB0cmVlIG1hcCBvdmVydmlldwoKVGhpcyBwYXRj
aCBpbnRyb2R1Y2VzIGEgaGlnaC1sZXZlbCBtYXAgb2YgdGhlIExpbnV4IGtlcm5lbCBzb3VyY2Ug
dHJlZSwKZGVzY3JpYmluZyB0aGUgcHVycG9zZSBvZiBlYWNoIHRvcC1sZXZlbCBkaXJlY3Rvcnku
IFRoZSBnb2FsIGlzIHRvIGhlbHAKbmV3IGFuZCBleHBlcmllbmNlZCBjb250cmlidXRvcnMgYWxp
a2UgdW5kZXJzdGFuZCB0aGUgc3RydWN0dXJlIG9mIHRoZQprZXJuZWwgc291cmNlIGNvZGUuCgpU
aGlzIGRvY3VtZW50YXRpb24gYWltcyB0byBpbXByb3ZlIHRoZSBkaXNjb3ZlcmFiaWxpdHkgYW5k
IGFjY2Vzc2liaWxpdHkKb2YgdmFyaW91cyBrZXJuZWwgc3Vic3lzdGVtcyBhbmQgd2lsbCBiZSBl
eHRlbmRlZCB3aXRoIHN1YnN5c3RlbS1sZXZlbAptYXBzIGluIGZ1dHVyZSBjb250cmlidXRpb25z
LgoKU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBSYWV6ZXIgPHdyYWV6ZXJAZ21haWwuY29tPgoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vc291cmNlLW1hcC5yc3QgYi9Eb2N1bWVudGF0aW9uL3Nv
dXJjZS1tYXAucnN0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMTEx
MTExMTExMTExCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9zb3VyY2UtbWFwLnJz
dApAQAorLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKworPT09PT09PT09PT09
PT09PT09PT09PT09CitMaW51eCBLZXJuZWwgU291cmNlIE1hcAorPT09PT09PT09PT09PT09PT09
PT09PT09CisKK1RoaXMgZG9jdW1lbnQgcHJvdmlkZXMgYW4gb3ZlcnZpZXcgb2YgdGhlIExpbnV4
IGtlcm5lbCBzb3VyY2UgdHJlZSwgZGVzY3JpYmluZyB0aGUKK3B1cnBvc2Ugb2YgZWFjaCB0b3At
bGV2ZWwgZGlyZWN0b3J5LiBJdCBzZXJ2ZXMgYXMgYSByZWZlcmVuY2UgZm9yIGRldmVsb3BlcnMK
K2xvb2tpbmcgdG8gdW5kZXJzdGFuZCB0aGUgc3RydWN0dXJlIG9mIHRoZSBrZXJuZWwgc291cmNl
IGNvZGUuCisKK1RvcC1MZXZlbCBEaXJlY3RvcmllcworPT09PT09PT09PT09PT09PT09PT09CisK
Ky0gKiphcmNoLyoqOiBBcmNoaXRlY3R1cmUtc3BlY2lmaWMgY29kZSBmb3Igc3VwcG9ydGVkIENQ
VSBwbGF0Zm9ybXMgKGUuZy4sIHg4NiwgYXJtNjQpLgorLSAqKmJsb2NrLyoqOiBHZW5lcmljIGJs
b2NrIGxheWVyIGNvZGUgZm9yIG1hbmFnaW5nIGJsb2NrIGRldmljZXMuCistICoqY2VydHMvKio6
IENlcnRpZmljYXRlIG1hbmFnZW1lbnQgdXNlZCBmb3IgbW9kdWxlIHNpZ25pbmcgYW5kIGtlcm5l
bCB2ZXJpZmljYXRpb24uCistICoqY3J5cHRvLyoqOiBDcnlwdG9ncmFwaGljIGFsZ29yaXRobXMg
YW5kIHRoZSBjcnlwdG8gQVBJLgorLSAqKkRvY3VtZW50YXRpb24vKio6IEtlcm5lbCBkb2N1bWVu
dGF0aW9uLCBtb3N0bHkgaW4gcmVTdHJ1Y3R1cmVkVGV4dCBmb3JtYXQuCistICoqZHJpdmVycy8q
KjogRGV2aWNlIGRyaXZlcnMgb3JnYW5pemVkIGJ5IGNsYXNzLgorLSAqKmZzLyoqOiBGaWxlc3lz
dGVtIGNvZGUgYW5kIHRoZSBWaXJ0dWFsIEZpbGVzeXN0ZW0gU3dpdGNoIChWRlMpLgorLSAqKmlu
Y2x1ZGUvKio6IEhlYWRlciBmaWxlcyBzaGFyZWQgYWNyb3NzIGtlcm5lbCBjb21wb25lbnRzLgor
LSAqKmluaXQvKio6IENvZGUgZm9yIGtlcm5lbCBib290IGFuZCBpbml0aWFsaXphdGlvbi4KKy0g
Kippb191cmluZy8qKjogSGlnaC1wZXJmb3JtYW5jZSBhc3luY2hyb25vdXMgSS9PIHN1cHBvcnQu
CistICoqaXBjLyoqOiBJbnRlci1wcm9jZXNzIGNvbW11bmljYXRpb24gbWVjaGFuaXNtcy4KKy0g
KiprZXJuZWwvKio6IENvcmUga2VybmVsIGZ1bmN0aW9uYWxpdHkgaW5jbHVkaW5nIHNjaGVkdWxp
bmcsIHNpZ25hbHMsIGFuZCBzeXN0ZW0gY2FsbHMuCistICoqbGliLyoqOiBDb21tb24gdXRpbGl0
eSBmdW5jdGlvbnMuCistICoqTElDRU5TRVMvKio6IFNQRFggbGljZW5zZSBtZXRhZGF0YSBmb3Ig
Y29tcGxpYW5jZS4KKy0gKiptbS8qKjogTWVtb3J5IG1hbmFnZW1lbnQgc3Vic3lzdGVtLgorLSAq
Km5ldC8qKjogTmV0d29ya2luZyBwcm90b2NvbHMgYW5kIGluZnJhc3RydWN0dXJlLgorLSAqKnJ1
c3QvKio6IEluZnJhc3RydWN0dXJlIGZvciBSdXN0LWJhc2VkIGtlcm5lbCBjb21wb25lbnRzLgor
LSAqKnNhbXBsZXMvKio6IFNhbXBsZSBtb2R1bGVzIGFuZCB0ZXN0IGNvZGUuCistICoqc2NyaXB0
cy8qKjogQnVpbGQgYW5kIGNvbmZpZ3VyYXRpb24gc2NyaXB0cy4KKy0gKipzZWN1cml0eS8qKjog
U2VjdXJpdHkgbW9kdWxlcyBsaWtlIFNFTGludXggYW5kIEFwcEFybW9yLgorLSAqKnNvdW5kLyoq
OiBBdWRpbyBzdWJzeXN0ZW0gYW5kIGRyaXZlcnMuCistICoqdG9vbHMvKio6IFVzZXItc3BhY2Ug
dG9vbHMgcmVsYXRlZCB0byB0aGUga2VybmVsLgorLSAqKnVzci8qKjogSW5pdHJhbWZzIGltYWdl
IGNvbnN0cnVjdGlvbiBjb2RlLgorLSAqKnZpcnQvKio6IFZpcnR1YWxpemF0aW9uIGluZnJhc3Ry
dWN0dXJlIChlLmcuLCBLVk0pLgorCitTZWUgQWxzbworPT09PT09PT0KKworLSBgTUFJTlRBSU5F
UlMgPC4uL01BSU5UQUlORVJTPmBfOiBNYWludGFpbmVyIGNvbnRhY3QgaW5mb3JtYXRpb24uCist
IGBrZXJuZWwub3JnIERvY3VtZW50YXRpb24gPGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0
bWwvbGF0ZXN0Lz5gXwoK
--000000000000db042c0636850f9d--
