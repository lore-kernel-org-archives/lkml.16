Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475617E4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656270; cv=none; b=gBYXCmQRfSnbmgloXEfrj1hfmCk+Qltq0ZXa3xHFb7hZnSOZiNHJzQmzc0SL90ticMSRXE4RuE/IBHWk2azLiHjO/niNxXdqyWBnMXntoI9HWff9pbPo5+MxhVK8Ztj7dIrHYzIsC2Ej+SYMjuBGoyU2xZf5Yza8/VTFxEduw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656270; c=relaxed/simple;
	bh=J+giZeB1nGQyLstpdMGxH56JL+TCObbPV8QKpLDf4Y4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iTOOIeTmTFwgc9ux5/4DrCupJRTJSM4K1/Nst/NkZwScU9dLjPDPke/eVKREjzhmaAoPMKK46tNafEychvU6vT2tRudfWjcJjS0quyqUeke+P9IOw8Ug34/C2sc2x2YpL5KoQkeJHQKHSeZNMB9VjDVxotZKK997sFxBvX/bnOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Tx8keTq7; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Tx8keTq7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7H6mO4q0nClq44HpCW0anQPlhk29yZVL0iATcH2dfQQ=; b=Tx8keTq7wunSHryHsYM0NoeFnR
	/oWRoZ7Rd33R4/gazf1eeFhPpAUeOmXBmYBY2AtaYqb41LZdH3WDYKOPvnEU/d4NIL4ZfveWNZE64
	iynk2KvGccB4HVrk9day2fxO/fPhVn+rfqNDAmXKde0ZeQBewCDSGCPPchu3Dv5SSNLzadubIKokI
	kEC7HpPvGGv6MfeS9qG5oJ8AlzSGeuM00oXCc0vZC/zAQSKhgaf81amLTGduUuq+wfjILA56MLvhX
	0NPx8v1+Rj7tnlIm6GSfpXvrNLElLTW2HhzcJGccNJyaiIQKQfz1n3Xux5arzNkhdORoFip0sNHAI
	PWm44dwQ==;
Received: from [172.31.31.140] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8avy-0000000CEmt-2qY7;
	Sat, 26 Apr 2025 08:30:50 +0000
Message-ID: <ac77c07ecda8805a5f942f5c71b3a2ef0f9183ce.camel@infradead.org>
Subject: Re: [PATCH v4 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
	 <lorenzo.stoakes@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>, "Sauerwein, David"
 <dssauerw@amazon.de>,  Anshuman Khandual <anshuman.khandual@arm.com>, Ard
 Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@linux.ibm.com>, Will
 Deacon <will@kernel.org>,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-mm@kvack.org, Ruihan Li
 <lrh2000@pku.edu.cn>
Date: Sat, 26 Apr 2025 09:30:50 +0100
In-Reply-To: <20250425163813.58b72a3aa2d3ebbd96d1929e@linux-foundation.org>
References: <20250423133821.789413-1-dwmw2@infradead.org>
	 <20250423133821.789413-8-dwmw2@infradead.org>
	 <e772cf66-c661-422d-911a-bc13ba4d59fb@lucifer.local>
	 <20250425163813.58b72a3aa2d3ebbd96d1929e@linux-foundation.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-Bb+h1mZfog+7aFPuGzRE"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-Bb+h1mZfog+7aFPuGzRE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-04-25 at 16:38 -0700, Andrew Morton wrote:
> On Fri, 25 Apr 2025 17:11:10 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracl=
e.com> wrote:
>=20
> > Andrew - can we drop this from mm-new? It's breaking it.
>=20
> I almost did, but David seems to have a fix.
>=20
> --- a/include/linux/mmzone.h~mm-mm_init-use-for_each_valid_pfn-in-init_un=
available_range-fix

The symptoms only manifested when it got used in
init_unavailable_range() but that's actually a fix for the sparsemem
implementation of for_each_valid_pfn(), as David H surmised.

Please could the fix be folded into
mm-implement-for_each_valid_pfn-for-config_sparsemem.patch ?

This is what it should look like with the fix:
https://git.infradead.org/?p=3Dusers/dwmw2/linux.git;a=3Dcommitdiff;h=3D55b=
ebbb093

If you want to keep the fix separate, then that's the patch that it
fixes. Do you want a commit message? I'll certainly give you a proper
SoB:

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Happy to resend the fixed series if it helps; it looks like you've
already basically sorted it though?

Thanks!

> +++ a/include/linux/mmzone.h
> @@ -2190,10 +2190,10 @@ static inline unsigned long next_valid_p
> =C2=A0	/*
> =C2=A0	 * Either every PFN within the section (or subsection for VMEMMAP)=
 is
> =C2=A0	 * valid, or none of them are. So there's no point repeating the c=
heck
> -	 * for every PFN; only call first_valid_pfn() the first time, and when
> -	 * crossing a (sub)section boundary (i.e. !(pfn & ~PFN_VALID_MASK)).
> +	 * for every PFN; only call first_valid_pfn() again when crossing a
> +	 * (sub)section boundary (i.e. !(pfn & ~PAGE_{SUB,}SECTION_MASK)).
> =C2=A0	 */
> -	if (pfn & (IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
> +	if (pfn & ~(IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP) ?
> =C2=A0		=C2=A0=C2=A0 PAGE_SUBSECTION_MASK : PAGE_SECTION_MASK))
> =C2=A0		return pfn;
> =C2=A0
> _
>=20


--=-Bb+h1mZfog+7aFPuGzRE
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQyNjA4MzA1
MFowLwYJKoZIhvcNAQkEMSIEIBy8KcCc+fF86qyfa11nuIr+YrYTVaV/xl9Dwe3Mzc+HMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAE1XjvUqETwYQ
Fi6Dt0mXFbk9r7kBv5JnxC1eKACBFQgvmA9gYg4MbXWkvX75XG1MumdeFs5u38KBvy8i/fIwRUCs
ZC0fKaucHDKKekAQQbAmje8Vc01wr/zvIJV24eamd1Q/H4hI+sY/eDUJVTmR7L78Lb40cdAmdgV9
Zd5D+r5bFan67bpy8zogWzK/0DIBRkyBB9z4Pg3DH7LZ+Rc9/ppqFYQjaHvkUqL1xZRaTGoJqoXx
xZA4SeBUGZZ1aM4MyLzYUP0FesjA7dmbYT4Rc1KUGPt5c799aT/ANb694Peg260Kfw/G9R79iLzg
ulIVdG2nU8EHtQ/v0jAHmSGXKSUXH4ZbsMRotfWbLwE+MikHAhZSedJzFc/HXNOqIsKpk2jlZhIA
xxytMccGANc2Ddd7Uj8psP4JSgHHnSGtCYlJOEmivQP/mmEzRKI9K1N+rbra+E+0/KmyjiSGzJK1
doHf+yRLAaR1vcU7igsOVoiDgbbsP3zfEn7IlnxHZ5PLrAo7NqCPvdsMzZJbCsGKax4D2wB1F5EN
BzoXAqyeV4ApsIIcaRSsxEhPSo2Wco/rCmi60EDIGhUPSpJy1gn3tU/3xoev8q0a/ZzkSMGcaZs7
BZO8C3EnBw5R/JcZxCNps8XZqDRJMWV7XLH96zlhmoW9AsQcNRwa8UGLY90l2AkAAAAAAAA=


--=-Bb+h1mZfog+7aFPuGzRE--
