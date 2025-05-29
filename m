Received: from monticello.secure-endpoints.com (monticello.secure-endpoints.com [208.125.0.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD3BB67F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.125.0.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748561993; cv=none; b=mP/gu2JzQ/Be3yRiolJFI9azXfU0lZTj2j3TsLeVJDcxLR1VYv+H1HU7/QSmzgnitwCVlYbOu+LSRsFqxvVT47UklrCuAJZBdlbxjWWmH9qtilSsP0yvaccurKqggjd4aJWjDjXcSfav8j0Gjo7KPOQO1VpCtUJeRcBhpj7xcTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748561993; c=relaxed/simple;
	bh=1ouz4+FRjNePv4yEin0z7a1nbFS5U+LAtiVhPVnViAA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QBVTbFCoObhMoxjjczGnHnXVbUSPthHvrG0c2iLTaokJPYEyxAR2DwuHbx78dAU1S4/bu0iBfhiVS6lZX4gYq01ivc22qUy7I7uTn3TnDWeEcEPLg79KaKHJk+IbzMu8ZHdFuqwKRAZ7rheKok8WQuGVcHSSxm+HZFJ68jKewDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auristor.com; spf=pass smtp.mailfrom=auristor.com; dkim=pass (1024-bit key) header.d=auristor.com header.i=jaltman@auristor.com header.b=SeeTgTzs; arc=none smtp.client-ip=208.125.0.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auristor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auristor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=auristor.com header.i=jaltman@auristor.com header.b="SeeTgTzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=auristor.com; s=MDaemon; r=y; l=8753; t=1748561731;
	x=1749166531; i=jaltman@auristor.com; q=dns/txt; h=Message-ID:
	Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	Content-Language:Organization:Disposition-Notification-To:
	In-Reply-To:Content-Type; z=Received:=20from=20[IPV6=3A2603=3A70
	00=3A73c=3Abb00=3A8d11=3A8793=3Ae55a=3A9811]=20by=20auristor.com
	=20(IPv6=3A2001=3A470=3A1f07=3Af77=3Affff=3A=3A312)=20(MDaemon=2
	0PRO=20v25.0.3a)=20=0D=0A=09with=20ESMTPSA=20id=20md500100473639
	2.msg=3B=20Thu,=2029=20May=202025=2019=3A35=3A30=20-0400|Message
	-ID:=20<ea42a3fd-7ce8-43e0-a2d5-c5353070bfe2@auristor.com>|Date:
	=20Thu,=2029=20May=202025=2019=3A35=3A39=20-0400|MIME-Version:=2
	01.0|User-Agent:=20Mozilla=20Thunderbird|From:=20Jeffrey=20E=20A
	ltman=20<jaltman@auristor.com>|Subject:=20Re=3A=20[PATCH]=20afs=
	3A=20Replace=20simple_strtoul=20with=20kstrtoul=20in=0D=0A=20afs
	_parse_address|To:=20Su=20Hui=20<suhui@nfschina.com>,=20dhowells
	@redhat.com,=20marc.dionne@auristor.com|Cc:=20linux-afs@lists.in
	fradead.org,=20linux-kernel@vger.kernel.org,=0D=0A=20kernel-jani
	tors@vger.kernel.org|References:=20<20250527084916.1699109-1-suh
	ui@nfschina.com>|Content-Language:=20en-US|Organization:=20AuriS
	tor,=20Inc.|Disposition-Notification-To:=20Jeffrey=20E=20Altman=
	20<jaltman@auristor.com>|In-Reply-To:=20<20250527084916.1699109-
	1-suhui@nfschina.com>|Content-Type:=20multipart/signed=3B=20prot
	ocol=3D"application/pkcs7-signature"=3B=20micalg=3Dsha-256=3B=20
	boundary=3D"------------ms050301050905090300030202"; bh=1ouz4+FR
	jNePv4yEin0z7a1nbFS5U+LAtiVhPVnViAA=; b=SeeTgTzsM+fR4tKjGtGvaRkJ
	lEMOaGfp0ygEZcJMLFVu2y8PAZ1yiw0e57EARM2/l9fIOTXds8mIO9ckrVP+C1LZ
	Sf/z8wVTlBNv03gS2yl2721XHc+tYu+MtlOORtS3aNyMTkjHHpliHJbogqmjLolI
	I6Pd6LT7liyRGhRwgQk=
X-MDAV-Result: clean
X-MDAV-Processed: monticello.secure-endpoints.com, Thu, 29 May 2025 19:35:31 -0400
Received: from [IPV6:2603:7000:73c:bb00:8d11:8793:e55a:9811] by auristor.com (IPv6:2001:470:1f07:f77:ffff::312) (MDaemon PRO v25.0.3a) 
	with ESMTPSA id md5001004736392.msg; Thu, 29 May 2025 19:35:30 -0400
X-Spam-Processed: monticello.secure-endpoints.com, Thu, 29 May 2025 19:35:30 -0400
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 2603:7000:73c:bb00:8d11:8793:e55a:9811
X-MDHelo: [IPV6:2603:7000:73c:bb00:8d11:8793:e55a:9811]
X-MDArrival-Date: Thu, 29 May 2025 19:35:30 -0400
X-MDOrigin-Country: US, NA
X-Authenticated-Sender: jaltman@auristor.com
X-Return-Path: prvs=1244a08b51=jaltman@auristor.com
X-Envelope-From: jaltman@auristor.com
X-MDaemon-Deliver-To: linux-kernel@vger.kernel.org
Message-ID: <ea42a3fd-7ce8-43e0-a2d5-c5353070bfe2@auristor.com>
Date: Thu, 29 May 2025 19:35:39 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeffrey E Altman <jaltman@auristor.com>
Subject: Re: [PATCH] afs: Replace simple_strtoul with kstrtoul in
 afs_parse_address
To: Su Hui <suhui@nfschina.com>, dhowells@redhat.com, marc.dionne@auristor.com
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20250527084916.1699109-1-suhui@nfschina.com>
Content-Language: en-US
Organization: AuriStor, Inc.
In-Reply-To: <20250527084916.1699109-1-suhui@nfschina.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms050301050905090300030202"
X-MDCFSigsAdded: auristor.com

This is a cryptographically signed message in MIME format.

--------------ms050301050905090300030202
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNS8yNy8yMDI1IDQ6NDkgQU0sIFN1IEh1aSB3cm90ZToNCj4ga3N0cnRvdWwoKSBpcyBi
ZXR0ZXIgYmVjYXVzZSBzaW1wbGVfc3RydG91bCgpIGlnbm9yZXMgb3ZlcmZsb3cgd2hpY2gN
Cj4gbWF5IGxlYWQgdG8gdW5leHBlY3RlZCByZXN1bHRzLg0KPg0KPiBTaWduZWQtb2ZmLWJ5
OiBTdSBIdWk8c3VodWlAbmZzY2hpbmEuY29tPg0KPiAtLS0NCj4gICBmcy9hZnMvYWRkcl9w
cmVmcy5jIHwgMTAgKysrKy0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9mcy9hZnMvYWRkcl9w
cmVmcy5jIGIvZnMvYWZzL2FkZHJfcHJlZnMuYw0KPiBpbmRleCBjMDM4NDIwMWI4ZmUuLmFl
NGY0YjM3MTg4MiAxMDA2NDQNCj4gLS0tIGEvZnMvYWZzL2FkZHJfcHJlZnMuYw0KPiArKysg
Yi9mcy9hZnMvYWRkcl9wcmVmcy5jDQo+IEBAIC0xMTgsNyArMTE4LDEwIEBAIHN0YXRpYyBp
bnQgYWZzX3BhcnNlX2FkZHJlc3MoY2hhciAqcCwgc3RydWN0IGFmc19hZGRyX3ByZWZlcmVu
Y2UgKnByZWYpDQo+ICAgDQo+ICAgCWlmICgqcCA9PSAnLycpIHsNCj4gICAJCXArKzsNCj4g
LQkJdG1wID0gc2ltcGxlX3N0cnRvdWwocCwgJnAsIDEwKTsNCj4gKwkJaWYgKGtzdHJ0b3Vs
KHAsIDEwLCAmdG1wKSkgew0KPiArCQkJcHJfd2FybigiSW52YWxpZCBhZGRyZXNzXG4iKTsN
Cj4gKwkJCXJldHVybiAtRUlOVkFMOw0KPiArCQl9DQo+ICAgCQlpZiAodG1wID4gbWFzaykg
ew0KPiAgIAkJCXByX3dhcm4oIlN1Ym5ldCBtYXNrIHRvbyBsYXJnZVxuIik7DQo+ICAgCQkJ
cmV0dXJuIC1FSU5WQUw7DQo+IEBAIC0xMzAsMTEgKzEzMyw2IEBAIHN0YXRpYyBpbnQgYWZz
X3BhcnNlX2FkZHJlc3MoY2hhciAqcCwgc3RydWN0IGFmc19hZGRyX3ByZWZlcmVuY2UgKnBy
ZWYpDQo+ICAgCQltYXNrID0gdG1wOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKCpwKSB7DQo+
IC0JCXByX3dhcm4oIkludmFsaWQgYWRkcmVzc1xuIik7DQo+IC0JCXJldHVybiAtRUlOVkFM
Ow0KPiAtCX0NCj4gLQ0KPiAgIAlwcmVmLT5zdWJuZXRfbWFzayA9IG1hc2s7DQo+ICAgCXJl
dHVybiAwOw0KPiAgIH0NCg0KU3UgSHVpLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBjb250cmli
dXRpb24gYnV0IEkgZG8gbm90IGJlbGlldmUgdGhpcyBwYXRjaCBpcyBjb3JyZWN0Lg0KDQpU
aGUgc2Vjb25kIGJsb2NrIGlzIHJlcXVpcmVkIGV2ZW4gaWYgdGhlIHNpbXBsZV9zdHJvdWwo
KSBpcyByZXBsYWNlZCBieSANCmtzdHJ0b3VsKCkgYXMgaXQgcHJvdGVjdHMgYWdhaW5zdCBh
biBpbnB1dCBzdHJpbmcgd2hpY2ggZG9lcyBub3QgY29udGFpbiANCnRoZSBvcHRpb25hbCBz
dWJuZXQgbWFzayBidXQgaGFzIHNvbWUgb3RoZXIgY2hhcmFjdGVycyBhZnRlciB0aGUgYWRk
cmVzcy4NCg0KYWZzX3BhcnNlX2FkZHJlc3MoKSBhbHJlYWR5IGhhcyBpdHMgb3duIG92ZXJm
bG93IGNoZWNrcyBmb2xsb3dpbmcgdGhlIA0Kc2ltcGxlX3N0cnRvdWwoKSBjYWxsIHdoaWNo
IGlzIHNwZWNpZmljIHRvIHRoZSBpbnRlcnByZXRhdGlvbiBvZiB0aGUgDQphbGxvd2VkIHN1
Ym5ldCBtYXNrIHZhbHVlcy4NCg0KRG8geW91IHNlZSBhbiBvdmVyZmxvdyBjb25kaXRpb24g
d2hpY2ggd291bGQgbm90IGJlIGNhdWdodCBieSB0aG9zZSANCmNoZWNrcyB3aGljaCB3b3Vs
ZCBiZSBjYXVnaHQgYnkgdXNlIG9mIGtzdHJ0b3VsKCk/DQoNClRoYW5rcyBhZ2Fpbi4NCg0K
SmVmZnJleSBBbHRtYW4NCg0KDQo=

--------------ms050301050905090300030202
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
DHEwggXSMIIEuqADAgECAhBAAYJpmi/rPn/F0fJyDlzMMA0GCSqGSIb3DQEBCwUAMDoxCzAJ
BgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQgQ0EgQTEz
MB4XDTIyMDgwNDE2MDQ0OFoXDTI1MTAzMTE2MDM0OFowcDEvMC0GCgmSJomT8ixkAQETH0Ew
MTQxMEQwMDAwMDE4MjY5OUEyRkQyMDAwMjMzQ0QxGTAXBgNVBAMTEEplZmZyZXkgRSBBbHRt
YW4xFTATBgNVBAoTDEF1cmlTdG9yIEluYzELMAkGA1UEBhMCVVMwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQCkC7PKBBZnQqDKPtZPMLAy77zo2DPvwtGnd1hNjPvbXrpGxUb3
xHZRtv179LHKAOcsY2jIctzieMxf82OMyhpBziMPsFAG/ukihBMFj3/xEeZVso3K27pSAyyN
fO/wJ0rX7G+ges22Dd7goZul8rPaTJBIxbZDuaykJMGpNq4PQ8VPcnYZx+6b+nJwJJoJ46kI
EEfNh3UKvB/vM0qtxS690iAdgmQIhTl+qfXq4IxWB6b+3NeQxgR6KLU4P7v88/tvJTpxIKkg
9xj89ruzeThyRFd2DSe3vfdnq9+g4qJSHRXyTft6W3Lkp7UWTM4kMqOcc4VSRdufVKBQNXjG
IcnhAgMBAAGjggKcMIICmDAOBgNVHQ8BAf8EBAMCBPAwgYQGCCsGAQUFBwEBBHgwdjAwBggr
BgEFBQcwAYYkaHR0cDovL2NvbW1lcmNpYWwub2NzcC5pZGVudHJ1c3QuY29tMEIGCCsGAQUF
BzAChjZodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2NlcnRzL3RydXN0aWRjYWEx
My5wN2MwHwYDVR0jBBgwFoAULbfeG1l+KpguzeHUG+PFEBJe6RQwCQYDVR0TBAIwADCCASsG
A1UdIASCASIwggEeMIIBGgYLYIZIAYb5LwAGAgEwggEJMEoGCCsGAQUFBwIBFj5odHRwczov
L3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRpZmljYXRlcy9wb2xpY3kvdHMvaW5kZXguaHRt
bDCBugYIKwYBBQUHAgIwga0MgapUaGlzIFRydXN0SUQgQ2VydGlmaWNhdGUgaGFzIGJlZW4g
aXNzdWVkIGluIGFjY29yZGFuY2Ugd2l0aCBJZGVuVHJ1c3QncyBUcnVzdElEIENlcnRpZmlj
YXRlIFBvbGljeSBmb3VuZCBhdCBodHRwczovL3NlY3VyZS5pZGVudHJ1c3QuY29tL2NlcnRp
ZmljYXRlcy9wb2xpY3kvdHMvaW5kZXguaHRtbDBFBgNVHR8EPjA8MDqgOKA2hjRodHRwOi8v
dmFsaWRhdGlvbi5pZGVudHJ1c3QuY29tL2NybC90cnVzdGlkY2FhMTMuY3JsMB8GA1UdEQQY
MBaBFGphbHRtYW5AYXVyaXN0b3IuY29tMB0GA1UdDgQWBBQB+nzqgljLocLTsiUn2yWqEc2s
gjAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwDQYJKoZIhvcNAQELBQADggEBAJwV
eycprp8Ox1npiTyfwc5QaVaqtoe8Dcg2JXZc0h4DmYGW2rRLHp8YL43snEV93rPJVk6B2v4c
WLeQfaMrnyNeEuvHx/2CT44cdLtaEk5zyqo3GYJYlLcRVz6EcSGHv1qPXgDT0xB/25etwGYq
utYF4Chkxu4KzIpq90eDMw5ajkexw+8ARQz4N5+d6NRbmMCovd7wTGi8th/BZvz8hgKUiUJo
Qle4wDxrdXdnIhCP7g87InXKefWgZBF4VX21t2+hkc04qrhIJlHrocPG9mRSnnk2WpsY0MXt
a8ivbVKtfpY7uSNDZSKTDi1izEFH5oeQdYRkgIGb319a7FjslV8wggaXMIIEf6ADAgECAhBA
AXA7OrqBjMk8rp4OuNQSMA0GCSqGSIb3DQEBCwUAMEoxCzAJBgNVBAYTAlVTMRIwEAYDVQQK
EwlJZGVuVHJ1c3QxJzAlBgNVBAMTHklkZW5UcnVzdCBDb21tZXJjaWFsIFJvb3QgQ0EgMTAe
Fw0yMDAyMTIyMTA3NDlaFw0zMDAyMTIyMTA3NDlaMDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQK
EwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRydXN0SUQgQ0EgQTEzMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAu6sUO01SDD99PM+QdZkNxKxJNt0NgQE+Zt6ixaNP0JKSjTd+SG5L
wqxBWjnOgI/3dlwgtSNeN77AgSs+rA4bK4GJ75cUZZANUXRKw/et8pf9Qn6iqgB63OdHxBN/
15KbM3HR+PyiHXQoUVIevCKW8nnlWnnZabT1FejOhRRKVUg5HACGOTfnCOONrlxlg+m1Vjgn
o1uNqNuLM/jkD1z6phNZ/G9IfZGI0ppHX5AA/bViWceX248VmefNhSR14ADZJtlAAWOi2un0
3bqrBPHA9nDyXxI8rgWLfUP5rDy8jx2hEItg95+ORF5wfkGUq787HBjspE86CcaduLka/Bk2
VwIDAQABo4IChzCCAoMwEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwgYkG
CCsGAQUFBwEBBH0wezAwBggrBgEFBQcwAYYkaHR0cDovL2NvbW1lcmNpYWwub2NzcC5pZGVu
dHJ1c3QuY29tMEcGCCsGAQUFBzAChjtodHRwOi8vdmFsaWRhdGlvbi5pZGVudHJ1c3QuY29t
L3Jvb3RzL2NvbW1lcmNpYWxyb290Y2ExLnA3YzAfBgNVHSMEGDAWgBTtRBnA0/AGi+6ke75C
5yZUyI42djCCASQGA1UdIASCARswggEXMIIBEwYEVR0gADCCAQkwSgYIKwYBBQUHAgEWPmh0
dHBzOi8vc2VjdXJlLmlkZW50cnVzdC5jb20vY2VydGlmaWNhdGVzL3BvbGljeS90cy9pbmRl
eC5odG1sMIG6BggrBgEFBQcCAjCBrQyBqlRoaXMgVHJ1c3RJRCBDZXJ0aWZpY2F0ZSBoYXMg
YmVlbiBpc3N1ZWQgaW4gYWNjb3JkYW5jZSB3aXRoIElkZW5UcnVzdCdzIFRydXN0SUQgQ2Vy
dGlmaWNhdGUgUG9saWN5IGZvdW5kIGF0IGh0dHBzOi8vc2VjdXJlLmlkZW50cnVzdC5jb20v
Y2VydGlmaWNhdGVzL3BvbGljeS90cy9pbmRleC5odG1sMEoGA1UdHwRDMEEwP6A9oDuGOWh0
dHA6Ly92YWxpZGF0aW9uLmlkZW50cnVzdC5jb20vY3JsL2NvbW1lcmNpYWxyb290Y2ExLmNy
bDAdBgNVHQ4EFgQULbfeG1l+KpguzeHUG+PFEBJe6RQwHQYDVR0lBBYwFAYIKwYBBQUHAwIG
CCsGAQUFBwMEMA0GCSqGSIb3DQEBCwUAA4ICAQB/7BKcygLX6Nl4a03cDHt7TLdPxCzFvDF2
bkVYCFTRX47UfeomF1gBPFDee3H/IPlLRmuTPoNt0qjdpfQzmDWN95jUXLdLPRToNxyaoB5s
0hOhcV6H08u3FHACBif55i0DTDzVSaBv0AZ9h1XeuGx4Fih1Vm3Xxz24GBqqVudvPRLyMJ7u
6hvBqTIKJ53uCs3dyQLZT9DXnp+kJv8y7ZSAY+QVrI/dysT8avtn8d7k7azNBkfnbRq+0e88
QoBnel6u+fpwbd5NLRHywXeH+phbzULCa+bLPRMqJaW2lbhvSWrMHRDy3/d8HvgnLCBFK2s4
Spns4YCN4xVcbqlGWzgolHCKUH39vpcsDo1ymZFrJ8QR6ihIn8FmJ5oKwAnnd/G6ADXFC9bu
db9+532phSAXOZrrecIQn+vtP366PC+aClAPsIIDJDsotS5z4X2JUFsNIuEgXGqhiKE7SuZb
rFG9sdcLprSlJN7TsRDc0W2b9nqwD+rj/5MN0C+eKwha+8ydv0+qzTyxPP90KRgaegGowC4d
UsZyTk2n4Z3MuAHX5nAZL/Vh/SyDj/ajorV44yqZBzQ3ChKhXbfUSwe2xMmygA2Z5DRwMRJn
p/BscizYdNk2WXJMTnH+wVLN8sLEwEtQR4eTLoFmQvrK2AMBS9kW5sBkMzINt/ZbbcZ3F+eA
MDGCBAEwggP9AgEBME4wOjELMAkGA1UEBhMCVVMxEjAQBgNVBAoTCUlkZW5UcnVzdDEXMBUG
A1UEAxMOVHJ1c3RJRCBDQSBBMTMCEEABgmmaL+s+f8XR8nIOXMwwDQYJYIZIAWUDBAIBBQCg
ggKEMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDUyOTIz
MzUzOVowLwYJKoZIhvcNAQkEMSIEIECELZaaL4iyPZQW7IV/Kehd1FUwJfhkfYLFEgCk+N4N
MF0GCSsGAQQBgjcQBDFQME4wOjELMAkGA1UEBhMCVVMxEjAQBgNVBAoTCUlkZW5UcnVzdDEX
MBUGA1UEAxMOVHJ1c3RJRCBDQSBBMTMCEEABgmmaL+s+f8XR8nIOXMwwXwYLKoZIhvcNAQkQ
AgsxUKBOMDoxCzAJBgNVBAYTAlVTMRIwEAYDVQQKEwlJZGVuVHJ1c3QxFzAVBgNVBAMTDlRy
dXN0SUQgQ0EgQTEzAhBAAYJpmi/rPn/F0fJyDlzMMIIBVwYJKoZIhvcNAQkPMYIBSDCCAUQw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBggqhkiG9w0DAgIBBTAN
BggqhkiG9w0DAgIBBTAHBgUrDgMCBzANBggqhkiG9w0DAgIBBTAHBgUrDgMCGjALBglghkgB
ZQMEAgEwCwYJYIZIAWUDBAICMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgQwCwYJYIZIAWUD
BAIHMAsGCWCGSAFlAwQCCDALBglghkgBZQMEAgkwCwYJYIZIAWUDBAIKMAsGCSqGSIb3DQEB
ATALBgkrgQUQhkg/AAIwCAYGK4EEAQsAMAgGBiuBBAELATAIBgYrgQQBCwIwCAYGK4EEAQsD
MAsGCSuBBRCGSD8AAzAIBgYrgQQBDgAwCAYGK4EEAQ4BMAgGBiuBBAEOAjAIBgYrgQQBDgMw
DQYJKoZIhvcNAQEBBQAEggEAmKV/MraUkvn6rEMv8yJmU1gQvYrRUgrnB3oQ6Wvvr/2jkixF
XHgD6bK0GGrlXd/l4fsdovJmx4alReEsazSaIT7lEZ0gtXuuLPDUNZv6ImTL3xYdnJFyuDpD
CaoVI7XklQ2JiM3tHfXZ2j3DFJpoy3+jBeouqIPghPL4tIdmhnS33FL5B8FauRIqlzzL9OeQ
XC1+Q1cB3vbQ/QHIQkpOtF/QKqWnXLar3VAuvn4E2zEVIkCs6LOqcGf71Uf3UTgR6ejgAQMt
G5SUxlHJQnvaHWZ1hbYxIVC9bLT+JJkbUCzet2HY7ZP7OhXfBsd4EPYMR2TokcxnggO48TyL
ux+LEQAAAAAAAA==
--------------ms050301050905090300030202--

