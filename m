Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8843118732B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664057; cv=none; b=LUgXsuIv5AXMKvoh0pqsVFiVUX0SWvDvxbFKyXadYB58TcqCgSNExhErepvs6BJUZ66Qlv3GAlIcfYzP1THDryu411rc1b/bwqCXSvZhH7YgZGoL5VO/yseg7IyQLMkJ6sSs0j2T3EyM3mPOY5wGjiCA+xFLugo8DSbGQAbjbm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664057; c=relaxed/simple;
	bh=sJ7gLBtKz3H15vFMV5KguW4eDRGFTsoIft0x8fuOKl8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nOFsVOWOZQ92m9ZQZx0ALllA96GVcFBVqemrcDCL8MF4ZWB5RO8roulpoPLO9Oc67Y4En+U/CN1MdsWAk/AQ8XlX7fEr6OCd1aYyckHjisJGDq02sanJg3G+MPy3iEmwHry5mvwFDAiiVNzFLXn6UVdDDxPyc7KO3QzAp2SNKZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xc/sPVUP; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xc/sPVUP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pR7+wKYvF3UlTLNmuHgVsuRpdnFb96aBkgiB+o1vatM=; b=Xc/sPVUP93tGom01AR6YDm9uK9
	t9bDgr2XWKsoVxUnokyCQmj7kyRE+uk0k0Z3N17/tfJxxFdKVuwu+62AgoJr7kkcF6uroycU/cm9C
	Zkn7jf9x4lWcOGyJtY+XPxvV72+ZyNx8O3Pc2jqEgjkleaTDA6WH2wrR7uZrwY9rBLmGBgClf+IYG
	A4e0AuUjxF06mvHeMmLx86PAkGKe2ac1e5GvPaQNrQ8dvWGs2HyDuYFymn2vMn3EBGMvp857+VHXd
	AzO3HfxxEGmgRudoHNDgGDjKXYEQAWbVGxviGOP7d4AlX2BorvUddPMFi4XI/1q+BmSEo7F7DZMFj
	IeutR3Dw==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Efa-0000000798l-2nn8;
	Thu, 03 Apr 2025 07:07:25 +0000
Message-ID: <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>
Subject: Re: [RFC PATCH 3/3] mm: Implement for_each_valid_pfn() for
 CONFIG_SPARSEMEM
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Sauerwein, David"
 <dssauerw@amazon.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Ard
 Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Mike Rapoport <rppt@linux.ibm.com>, Will
 Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
Date: Thu, 03 Apr 2025 08:07:22 +0100
In-Reply-To: <Z-4phOInXZlxFwk9@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
	 <20250402201841.3245371-1-dwmw2@infradead.org>
	 <20250402201841.3245371-3-dwmw2@infradead.org>
	 <Z-4phOInXZlxFwk9@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-qAK7rRgcJNElYtkPTc5+"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-qAK7rRgcJNElYtkPTc5+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-04-03 at 09:24 +0300, Mike Rapoport wrote:
> On Wed, Apr 02, 2025 at 09:18:41PM +0100, David Woodhouse wrote:
> > From: David Woodhouse <dwmw@amazon.co.uk>
> >=20
> > Introduce a pfn_first_valid() helper which takes a pointer to the
> > PFN and
> > updates it to point to the first valid PFN starting from that
> > point, and
> > returns true if a valid PFN was found.
> >=20
> > This largely mirrors pfn_valid(), calling into a
> > pfn_section_first_valid()
> > helper which is trivial for the !CONFIG_SPARSEMEM_VMEMMAP case, and
> > in
> > the VMEMMAP case will skip to the next subsection as needed.
> >=20
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>=20
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks.

> with a small nit below
>=20
> > +static inline bool first_valid_pfn(unsigned long *p_pfn)
> > +{
> > +	unsigned long pfn =3D *p_pfn;
> > +	unsigned long nr =3D pfn_to_section_nr(pfn);
> > +	struct mem_section *ms;
> > +	bool ret =3D false;
> > +
> > +	ms =3D __pfn_to_section(pfn);
> > +
> > +	rcu_read_lock_sched();
> > +
> > +	while (!ret && nr <=3D __highest_present_section_nr) {
>=20
> This could be just for(;;), we anyway break when ret becomes true or we g=
et
> past last present section.

True for the 'ret' part but not *nicely* for the last present section.
If the original pfn is higher than the last present section it could
trigger that check before entering the loop.

Yes, in that case 'ms' will be NULL, valid_section(NULL) is false and
you're right that it'll make it through to the check in the loop
without crashing. So it would currently be harmless, but I didn't like
it. It's relying on the loop not to do the wrong thing with an input
which is arguably invalid.

I'll see if I can make it neater. I may drop the 'ret' variable
completely and just turn the match clause into unlock-and-return-true.
I *like* having a single unlock site. But I think I like simpler loop
code more than that.

FWIW I think the check for (PHYS_PFN(PFN_PHYS(pfn)) !=3D pfn) at the
start of pfn_valid() a few lines above is similarly redundant. Because
if the high bits are set in the PFN then pfn_to_section_nr(pfn) is
surely going to be higher than NR_MEM_SECTIONS and it'll get thrown out
at the very next check, won't it?

I care because I didn't bother to duplicate that 'redundant' check in
my first_valid_pfn(), so if there's a reason for it that I'm missing, I
should take a closer look.

I'm also missing the reason why the FLATMEM code in memory_model.h does
'unsigned long pfn_offset =3D ARCH_PFN_OFFSET' and then uses its local
pfn_offset variable, instead of just using ARCH_PFN_OFFSET directly as
I do in the FLATMEM for_each_valid_pfn() macro.

> > +		if (valid_section(ms) &&
> > +		=C2=A0=C2=A0=C2=A0 (early_section(ms) || pfn_section_first_valid(ms,=
 &pfn))) {
> > +			ret =3D true;
> > +			break;
> > +		}
> > +
> > +		nr++;
> > +		if (nr > __highest_present_section_nr)
> > +			break;
> > +
> > +		pfn =3D section_nr_to_pfn(nr);
> > +		ms =3D __pfn_to_section(pfn);
> > +	}
> > +
> > +	rcu_read_unlock_sched();
> > +
> > +	*p_pfn =3D pfn;
> > +
> > +	return ret;
> > +}
> > +
> > +#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)	=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > +	for ((_pfn) =3D (_start_pfn);			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 first_valid_pfn(&(_pfn)) && (_pfn) < (_end_p=
fn);=C2=A0 \
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 (_pfn)++)
> > +
> > =C2=A0#endif
> > =C2=A0
> > =C2=A0static inline int pfn_in_present_section(unsigned long pfn)
> > --=20
> > 2.49.0
> >=20
>=20


--=-qAK7rRgcJNElYtkPTc5+
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwMzA3MDcy
MlowLwYJKoZIhvcNAQkEMSIEIFzO0Ql0PSt8poEKcQsXL2k5BFIOEOEGfcqQFLTOPADBMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAJq7Ukj4R9Llh
h8yDr2uE7umGY6pssQBavb86plcIWwDfg2UJRtzZ1cTGcxkuWWtkJMLBitSZImt7QUEz9l6sKKQ5
gD61q7gI3cTXMW3QcF42zUzqywvYvJoJkSRElevKzrAmmi49pK+RsdAmy2i0+m7Aq+i5RbfYM51Y
nth9bDCKjZr9iqrYivFk8A8RWqqi37mWRBaNofb/K7DiKzaD0TPqP4wVgQ4l15HR4wvwyRhOfPQM
14feXzaf+gsqt8KBWXiqglnb8dgpE7xVNH8HqOXHt0yKmf/tHDixLRnIDfJT37L5KphA2iB+qljc
ZtJITPPj6hn8DH/ZgyfgjxPKKVww0ueAEiH8KXJ8sYwP0Ml2RGKa55mhBmHcKoVxHzvN3WEATQX9
xC6TcmWyp46+YpXYf/DLjhabaitp8W3U8/EtJ1iNZ31cs7yFgtLXTO4SCQN8TsCu3shcpoVlooXd
1/82Vf1bhkVecffEUj95bV+hwfKFSPQCDVtJic9dwLuzHpm5LxCHslpm3zmKk2HV8hrgHK6srOYf
HfJgzGh6vjM+cuceaq6dX9Fh6pTs9/rbo1a0crRO5tenGjsYBck8HXCqbZKoWmWxi7JcRGlHRIUR
3NnFu9u6XlsxKH++lCGihSd7jst+QTSvkaQq23rcgNqfno18xtw4ZAOPSNEQ+SgAAAAAAAA=


--=-qAK7rRgcJNElYtkPTc5+--
