Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6C92BEC36
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353550; cv=none; b=afWAbGBqiBMopbNmCbnt5O8wORh6IjRGBxfIcW7dEEe0+Eqctbf978biSg5iGXfZcvLag2Jyj9VKHtQ2Pu4J2kCo6J8cBaq8pG00Nhn5Hb6tKyAVZ1fNcWlUAnj5IdqoQSdhzRrjjzM6H2EnUBcj0lBwrJfeX2/jiA9XE5GxKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353550; c=relaxed/simple;
	bh=M7oppvkdl8yV9cMfkLqvfVrLIgJLs9EPl5iJ/I1jFEQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RhhhJS2IbC4uTcXW+7QOcmDRqMuyNOMiajAYEZcjR+k+vaT+EMYjIN7GD2OP1tVzKTA7hXOZwa20mXA3N0GJw8A1Is6ArUeCKFi9K21ouLGXfwFC62fznz5QA9AipvzTq1nYRfmESCSEHx6dUhIW/9zTN2UN35JmV2azPRS3DgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XjTtSHkD; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XjTtSHkD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WSOQ4dvTzeJfWv+IHK711vYfV4BEChTnKQrUs0MLM7U=; b=XjTtSHkDIaJQ+L9K79iHL6xRJb
	A2Nn8a1HHxbuIvPAn4blztQ/HP89k+BIkLUuy0h54w9fJ469fxFUNT+OcngKN6aDeUrh06Ir/gTkF
	vH3CyDe9+fs1rX0fR8xSQg8bZDclSzepyefsAMxmfqUQF8+NiA8FQckWlWAOGmM/OxsnKOUbb5V0e
	0b/sDnTeHa9GX3bbgsMu4Jw5e8Udt3NoznfyKmdiS07roE11v4NXsOH5t/xcairbppuCr72J+eXZk
	46VB/7JK7OxEaBFJLnTIkoYKl4ybhdJujOC+3n1bRJBrINI/oHY31BPUZvOFXBxZYZKWhd5vGBazP
	l1bt5ptQ==;
Received: from [172.31.31.140] (helo=u09cd745991455d.lumleys.internal)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7KBL-0000000BK89-20MK;
	Tue, 22 Apr 2025 20:25:29 +0000
Message-ID: <1cf8ff5dd37054c8430c0a7578e84b7eec3f2a05.camel@infradead.org>
Subject: Re: [PATCH v2] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>, Ruihan Li <lrh2000@pku.edu.cn>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 22 Apr 2025 21:25:27 +0100
In-Reply-To: <20250422132047.22c6cd3a00893bdfd6766df4@linux-foundation.org>
References: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
	 <aAZ1RzQdgllQYM04@kernel.org>
	 <asgvzub435pimtmjt7bsve2hyon6as5twncg3scmdwztvr2tct@nlaw5qsyw33g>
	 <20250422132047.22c6cd3a00893bdfd6766df4@linux-foundation.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-Ur9cZciEJ7G6ugZkCBza"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-Ur9cZciEJ7G6ugZkCBza
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-04-22 at 13:20 -0700, Andrew Morton wrote:
> On Tue, 22 Apr 2025 17:08:06 +0800 Ruihan Li <lrh2000@pku.edu.cn> wrote:
>=20
> > Hi Mike,
> >=20
> > Thanks for your review!
> >=20
> > On Mon, Apr 21, 2025 at 07:41:43PM +0300, Mike Rapoport wrote:
> > > On Sat, Apr 19, 2025 at 08:28:01PM +0800, Ruihan Li wrote:
> > > > Currently, memmap_init initializes pfn_hole with 0 instead of
> > > > ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating e=
ach
> > > > page from the page at address zero to the first available page, but=
 it
> > > > won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> > > > won't pass.
> > > >=20
> > > > If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if=
 the
> > > > kernel is used as a library and loaded at a very high address), the
> > > > pointless iteration for pages below ARCH_PFN_OFFSET will take a ver=
y
> > > > long time, and the kernel will look stuck at boot time.
> > > >=20
> > > > This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, =
which
> > > > avoids the problematic and useless iteration mentioned above.
> > > >=20
> > > > This problem has existed since commit 907ec5fca3dc ("mm: zero remai=
ning
> > > > unavailable struct pages").
> > > >=20
> > > > Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> > > > ---
> > > > Link to v1:
> > > > =C2=A0 - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-=
lrh2000@pku.edu.cn/
> > > > Changes since v1:
> > > > =C2=A0 - Removed the unnecessary Fixes tag.
> > > > =C2=A0 - Fixed the build issue for CONFIG_SPARSEMEM.
> > > >=20
> > > > =C2=A0 mm/mm_init.c | 9 +++++++++
> > > > =C2=A0 1 file changed, 9 insertions(+)
> > > >=20
> > > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > > index 84f14fa12..a697a83ff 100644
> > > > --- a/mm/mm_init.c
> > > > +++ b/mm/mm_init.c
> > > > @@ -969,6 +969,15 @@ static void __init memmap_init(void)
> > > > =C2=A0=C2=A0	unsigned long hole_pfn =3D 0;
> > > > =C2=A0=C2=A0	int i, j, zone_id =3D 0, nid;
> > > > =C2=A0=20
> > > > +#ifdef CONFIG_FLATMEM
> > > > +	/*
> > > > +	 * Pages below ARCH_PFN_OFFSET are invalid as far as pfn_valid is
> > > > +	 * concerned, so don't waste time iterating on them when looking
> > > > +	 * for holes.
> > > > +	 */
> > > > +	hole_pfn =3D ARCH_PFN_OFFSET;
> > > > +#endif
> > > > +
> > >=20
> > > I'd prefer a solution for both FLATMEM and SPARSMEM.=20
> > >=20
> > > David Woodhouse proposed a for_each_valid_pfn() a while ago:
> > >=20
> > > https://lore.kernel.org/all/20250404155959.3442111-1-dwmw2@infradead.=
org
> > >=20
> > > It can be used in init_unavailable_range() and will essentially skip =
the
> > > unpopulated memory map.
> >=20
> > for_each_valid_pfn sounds much better. Thanks for your input.
> >=20
> > However, the problem is that David's patch is not showing up in the
> > mainline, so what can I do to move forward with my patch?
> >=20
> > Perhaps you mean that I should wait until David's patch is merged and
> > send another patch to fix the problem?
>=20
> (cc David)

Want to add a patch on top of my tree at
https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/for_eac=
h_valid_pfn
and I'll send it on with the rest?


--=-Ur9cZciEJ7G6ugZkCBza
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQyMjIwMjUy
N1owLwYJKoZIhvcNAQkEMSIEINh/zndJEoWPeVePLBxcfXPnBL6GrpesBbqFYp0UskmKMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIA1gxp7JKUOvOC
/sxOxO/wOWgZiT4wN+r7/0CLFXYW8xzzs6+CNmThYMBnQepkvyXxDCztZqfPni8jpIr/0g2Awnq+
8npm5Gk+sRWLhJJ1w0dEhc6hKvAqeggx2C7YFCY10mV0toxAIvVdIV+sjGkcP3gOUYK+tzF4cNkq
FSJ9EA3P0mCusQfy9XsgNN6P+riOp6SYauRHzMnLvwMmFLQvehkyAV992ZVYnrlsx4BbZQxxrT4R
LYsGrDxhgvF2ZCqsvygKCy9NaxnkMc79+PMbf5XSiHHpjs3BoV6w4Xmr/OVtyJ9FwR3UfJXEYfJd
1zmMSwM4USOGjurPpe8rDXxTiAvVqFUZVBEqAoLLr6swbepWtAtuhL0wSWUUSlb/iCbZHMQc2fBc
IjFfgJGp1M1Z+4i6ClWT5NOuep5ZEhqcMfOTKiuXy17dBu6vevFH23dJ5gF4Yn94CVOW07yF9QwO
o1OrX20j6NHvENEfZA9nZdvWRcVQeEyPtwbJpWcGehHIrPW9IQUL+1JwtNmBogi/Vq/iKm9QDOJW
/lwENIDtCjOs44HMbN0cY1RjHqwWiHsesmFd/9Ahh0+NgEsiXSdOYN2QXYoaixlEsZ3dbpMQY7gR
8FzlphguZkuheEKj8MIFIuMsJ+YEQEFP9GLDWY+eDPy/B7x/OwDAwO6+WK3IRTAAAAAAAAA=


--=-Ur9cZciEJ7G6ugZkCBza--
