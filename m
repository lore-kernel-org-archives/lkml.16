Received: from monticello.secure-endpoints.com (monticello.secure-endpoints.com [208.125.0.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773EA22CBE3
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.125.0.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748608994; cv=none; b=Vb2ylcBnX0EcpvIkJ+XJg0uHHdDJE2eMt06v1wIp5dvK3TzLKfM3wCpfQr8LzWMHPaYiuNJUq+UC5aPgE4kzlIMM8xFfzFlYZW6NeHpufv3q9b+++dtuJiPFTN/0w6/2bXvjTRCZ9ZG7/K3PeDGYS+t2djQ8AJ1YzPrPwpS1lco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748608994; c=relaxed/simple;
	bh=+RZMR1CHUJjiZB2USgqQn+XYmw90Jacjujr8YCIV2XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJ2wh77gQd/JAbeUISsjFle6SNGpGUh1OlWKA7pzWSBStrtj9l3DKi6v01h8feDf/M9jUfsEFxSioT5TVRvI0lfkdH90gNdN3tNfYCGoxaAgWa04AQvqWAgnQ9e/QwcOfByZsKuU4bdFy29uE/5T8T6WLxzTTRcbjAifF1Oa3vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auristor.com; spf=pass smtp.mailfrom=auristor.com; dkim=pass (1024-bit key) header.d=auristor.com header.i=jaltman@auristor.com header.b=KVqyssCs; arc=none smtp.client-ip=208.125.0.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auristor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auristor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=auristor.com header.i=jaltman@auristor.com header.b="KVqyssCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=auristor.com; s=MDaemon; r=y; l=7383; t=1748608974;
	x=1749213774; i=jaltman@auristor.com; q=dns/txt; h=Message-ID:
	Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	Content-Language:From:Organization:Disposition-Notification-To:
	In-Reply-To:Content-Type; z=Received:=20from=20[IPV6=3A2603=3A70
	00=3A73c=3Abb00=3Adc7e=3A9c1d=3Ab0ad=3A49cd]=20by=20auristor.com
	=20(IPv6=3A2001=3A470=3A1f07=3Af77=3Affff=3A=3A312)=20(MDaemon=2
	0PRO=20v25.0.3a)=20=0D=0A=09with=20ESMTPSA=20id=20md500100473738
	8.msg=3B=20Fri,=2030=20May=202025=2008=3A42=3A54=20-0400|Message
	-ID:=20<f9f56006-8490-43cb-a622-6e95c3af1d24@auristor.com>|Date:
	=20Fri,=2030=20May=202025=2008=3A43=3A00=20-0400|MIME-Version:=2
	01.0|User-Agent:=20Mozilla=20Thunderbird|Subject:=20Re=3A=20[PAT
	CH]=20afs=3A=20Replace=20simple_strtoul=20with=20kstrtoul=20in=0
	D=0A=20afs_parse_address|To:=20Su=20Hui=20<suhui@nfschina.com>,=
	20dhowells@redhat.com,=20marc.dionne@auristor.com|Cc:=20linux-af
	s@lists.infradead.org,=20linux-kernel@vger.kernel.org,=0D=0A=20k
	ernel-janitors@vger.kernel.org|References:=20<1f027931-8781-4c6c
	-86c8-2d680b86974f@nfschina.com>|Content-Language:=20en-US|From:
	=20Jeffrey=20E=20Altman=20<jaltman@auristor.com>|Organization:=2
	0AuriStor,=20Inc.|Disposition-Notification-To:=20Jeffrey=20E=20A
	ltman=20<jaltman@auristor.com>|In-Reply-To:=20<1f027931-8781-4c6
	c-86c8-2d680b86974f@nfschina.com>|Content-Type:=20multipart/sign
	ed=3B=20protocol=3D"application/pkcs7-signature"=3B=20micalg=3Ds
	ha-256=3B=20boundary=3D"------------ms070404040307080304080807";
	bh=+RZMR1CHUJjiZB2USgqQn+XYmw90Jacjujr8YCIV2XU=; b=KVqyssCs1X4EV
	rUeOXV1gtk6FXHrsorwQeJfnU5TSo02lkMttZskfQDvxxUUFuEdl7NOgaRHkeUY9
	0grcjy7sPFgWYWmW16gXMMIYSD0kT+ikKM8kcMHbmwOC9HE9AIPprH6Vd600Ndms
	SzPs4mja6eTmBR+MHykrr7mYrdNNi8=
X-MDAV-Result: clean
X-MDAV-Processed: monticello.secure-endpoints.com, Fri, 30 May 2025 08:42:54 -0400
Received: from [IPV6:2603:7000:73c:bb00:dc7e:9c1d:b0ad:49cd] by auristor.com (IPv6:2001:470:1f07:f77:ffff::312) (MDaemon PRO v25.0.3a) 
	with ESMTPSA id md5001004737388.msg; Fri, 30 May 2025 08:42:54 -0400
X-Spam-Processed: monticello.secure-endpoints.com, Fri, 30 May 2025 08:42:54 -0400
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 2603:7000:73c:bb00:dc7e:9c1d:b0ad:49cd
X-MDHelo: [IPV6:2603:7000:73c:bb00:dc7e:9c1d:b0ad:49cd]
X-MDArrival-Date: Fri, 30 May 2025 08:42:54 -0400
X-MDOrigin-Country: US, NA
X-Authenticated-Sender: jaltman@auristor.com
X-Return-Path: prvs=1245565365=jaltman@auristor.com
X-Envelope-From: jaltman@auristor.com
X-MDaemon-Deliver-To: linux-kernel@vger.kernel.org
Message-ID: <f9f56006-8490-43cb-a622-6e95c3af1d24@auristor.com>
Date: Fri, 30 May 2025 08:43:00 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] afs: Replace simple_strtoul with kstrtoul in
 afs_parse_address
To: Su Hui <suhui@nfschina.com>, dhowells@redhat.com, marc.dionne@auristor.com
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <1f027931-8781-4c6c-86c8-2d680b86974f@nfschina.com>
Content-Language: en-US
From: Jeffrey E Altman <jaltman@auristor.com>
Organization: AuriStor, Inc.
In-Reply-To: <1f027931-8781-4c6c-86c8-2d680b86974f@nfschina.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms070404040307080304080807"
X-MDCFSigsAdded: auristor.com

This is a cryptographically signed message in MIME format.

--------------ms070404040307080304080807
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNS8zMC8yMDI1IDY6MjkgQU0sIFN1IEh1aSB3cm90ZToNCj4gT24gNS8zMC8yNSA3OjM1
IEFNLCBKZWZmcmV5IEUgQWx0bWFuIHdyb3RlOg0KPj4NCj4+IERvIHlvdSBzZWUgYW4gb3Zl
cmZsb3cgY29uZGl0aW9uIHdoaWNoIHdvdWxkIG5vdCBiZSBjYXVnaHQgYnkgdGhvc2UgDQo+
PiBjaGVja3Mgd2hpY2ggd291bGQgYmUgY2F1Z2h0IGJ5IHVzZSBvZiBrc3RydG91bCgpPw0K
PiBBY3R1YWxseSwgbm8gZXhhbXBsZSBpbiByZWFsaXR5Lg0KPiBJZiBwIGNhbiBlcXVhbCB0
byAnMHhmZmZmZmZmZmZmZmZmZmZmMDAwMDAwMDAwMDAwMDAwMScsIA0KPiBzaW1wbGVfc3Ry
dG91bCgpIGFuZCBrc3Ryb3VsKCkgYWxsIHRyYW5zZm9ybSAncCcgdG8gdW5zaWduZWQgbG9u
ZyANCj4gdmFsdWUgJzB4MScuDQo+IEJ1dCBrc3RydG91bCgpIHJldHVybiBhbiBlcnJvciBh
bmQgd2UgY2FuIGtub3cgb3ZlcmZsb3cgaGFwcGVucy7CoMKgSWYgDQo+ICdwJyBjYW4gYmUg
YSB2ZXJ5IGxvbmcgc3RyaW5nLCBrc3Ryb3VsKCkgbWFrZSBzZW5zZS4NCj4NClRoZSBleHBl
Y3RlZCB1c2UgY2FzZSBpcyBmb3IgdGhlIGlucHV0IHN0cmluZyBub3QgdG8gZXhjZWVkIDMg
DQpjaGFyYWN0ZXJzLsKgIFRoZSB2YWxpZCByYW5nZSBpcyBkZWNpbWFsIDAgdG8gMTI4LsKg
IFRoYXQgY291bGQgYmUgDQplbmZvcmNlZCBieSBzd2l0Y2hpbmcgdG8gc2ltcGxlX3N0cm50
b3VsKCkgYW5kIHJlbHlpbmcgdXBvbiB0aGUgZXhpc3RpbmcgDQpjaGVja3MuDQo=

--------------ms070404040307080304080807
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
ggKEMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDUzMDEy
NDMwMFowLwYJKoZIhvcNAQkEMSIEIEHtazrotQtfQKM98IGgHgZs9aHalxnewBvwb910+Ju/
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
DQYJKoZIhvcNAQEBBQAEggEAahvJzLJJEYu/fFClCYn3Hj4oG7C5VAAnXuSyf64cnUoNCr6D
kV+jFPD844uaXneBKV50oxQ2oEaT7EEH67LfgilU/GRxg0vGC0pCnsAcplbSEUZxoSz6KHw0
ktCBW4W1lwKN1mEh+NL3YHtT5NjsPBmBZxFXta6R1xdCU3bE7c1rWVCy6NGPQLMglgl37YbZ
UEw8Kxn7WxruwkEcb8FbFZeupG4o5a1U0K7r1OunjOlLv8VcGaoo8iIixTVbOFpQEL0rB8Um
cNxMDT6mJYDcAdGQQF+pNtXomqsTvul5iHmvE+eZJDVn5MEjieHHPK9fy+OFI4/dBpnhQIA0
NxPajgAAAAAAAA==
--------------ms070404040307080304080807--

