Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B42B201270
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508243; cv=none; b=tQhWZNt9sQrLISxexA7LEiPKuoES87kPWlljtn5F/sGWmWJEUMIfzSKpU/cRjXEIqvYNkVyIxgDm9VYyMpuQSR35Xd/BlA1z5xTJJ6v2CdRP6o3bhq+5GeKRacgRU8oX3AB6AlNBDjHVQF+Itm5BwlCvxIRB+EvhcZuncSJsYf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508243; c=relaxed/simple;
	bh=PwhfB+atpW7rBCF4+h+tWKVy5mk3upT4NI0njH2IfzA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VYqZZfw6RQ0gzzvMQCrnBx5It5ecqS2vjrD7g7KqNBfvd4skBwus2OnWc2mym5OEzIp7stpKxfUmsj2iIK20IqnSt9lXmyKRTl16rVpezuhOG7pvl7mWVBDxHEa3QyVA0TzuivQc6AM2TDsw1aUJ1uaK/ZnUSQLtm/98szhgsHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fs/1Y7q+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fs/1Y7q+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ePyej/S/qrnOLGG9wR7D8lEckZUVZHmbvvNqD3ktJlk=; b=fs/1Y7q+FXJyt5iuRwPh/skSFB
	1N0Ww6DjmWuf8N3lx64js7zNSbq+hIYC7HPK3a7QpeagDf3ikIBzBX8AlquUZ5irLRT4Wh/GIDAw8
	d48XLg0C/jxjyHYiDSDIl+KbYzPz2TDzLDcYo+s+xj5pN53tFF3VnrvCsxsENMxUMIEdsPJKn/zFd
	WrQyEi7DN0yARLSCznxbr1ZCgGyGPKzbD7j7nTezKlP0q+swIsSO6hY3ISs3Q6G1EUrihjvsK+F/f
	slvtadLc8/hXtdfxH8N5V8A6ZfIHG3OljS15RsmA8cx/1cPzJsq/eg4vtXYUDQC+GWtgT2l3PwxZs
	p/Hi2Z5A==;
Received: from [172.31.31.145] (helo=u09cd745991455d.lumleys.internal)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tza8X-00000006oJQ-39Vw;
	Tue, 01 Apr 2025 11:50:34 +0000
Message-ID: <1787b97c267b53127c60a61419d99751f8a66b1a.camel@infradead.org>
Subject: Re: [PATCH v4 2/4] memblock: update initialization of reserved pages
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
Date: Tue, 01 Apr 2025 12:50:33 +0100
In-Reply-To: <Z-vPBu5vAvFhYDzP@kernel.org>
References: <20210511100550.28178-1-rppt@kernel.org>
	 <20210511100550.28178-3-rppt@kernel.org>
	 <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
	 <Z-qrtJ6cs-kXpepR@kernel.org>
	 <b47d5f5602573bd082be3729ceddb3d1dc374ef1.camel@infradead.org>
	 <Z-vPBu5vAvFhYDzP@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-nnwfBxLTG/70tL6apTXw"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-nnwfBxLTG/70tL6apTXw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-04-01 at 14:33 +0300, Mike Rapoport wrote:
> On Mon, Mar 31, 2025 at 04:13:56PM +0100, David Woodhouse wrote:
> > On Mon, 2025-03-31 at 17:50 +0300, Mike Rapoport wrote:
> > > On Mon, Mar 31, 2025 at 01:50:33PM +0100, David Woodhouse wrote:
> > > > On Tue, 2021-05-11 at 13:05 +0300, Mike Rapoport wrote:
> > > >=20
> > > > On platforms with large NOMAP regions (e.g. which are actually rese=
rved
> > > > for guest memory to keep it out of the Linux address map and allow =
for
> > > > kexec-based live update of the hypervisor), this pointless loop end=
s up
> > > > taking a significant amount of time which is visible as guest steal
> > > > time during the live update.
> > > >=20
> > > > Can reserve_bootmem_region() skip the loop *completely* if no PFN i=
n
> > > > the range from start to end is valid? Or tweak the loop itself to h=
ave
> > > > an 'else' case which skips to the next valid PFN? Something like
> > > >=20
> > > > =C2=A0for(...) {
> > > > =C2=A0=C2=A0=C2=A0 if (pfn_valid(start_pfn)) {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> > > > =C2=A0=C2=A0=C2=A0 } else {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start_pfn =3D next_valid_pfn(s=
tart_pfn);
> > > > =C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0}
> > >=20
> > > My understanding is that you have large reserved NOMAP ranges that do=
n't
> > > appear as memory at all, so no memory map for them is created and so
> > > pfn_valid() is false for pfns in those ranges.
> > >=20
> > > If this is the case one way indeed would be to make
> > > reserve_bootmem_region() skip ranges with no valid pfns.
> > >=20
> > > Another way could be to memblock_reserved_mark_noinit() such ranges a=
nd
> > > then reserve_bootmem_region() won't even get called, but that would r=
equire
> > > firmware to pass that information somehow.
> >=20
> > I was thinking along these lines (not even build tested)...
> >=20
> > I don't much like the (unsigned long)-1 part. I might make the helper
> > 'static inline bool first_valid_pfn (unsigned long *pfn)' and return
> > success or failure. But that's an implementation detail.
> >=20
> > index 6d1fb6162ac1..edd27ba3e908 100644
> > --- a/include/asm-generic/memory_model.h
> > +++ b/include/asm-generic/memory_model.h
> > @@ -29,8 +29,43 @@ static inline int pfn_valid(unsigned long pfn)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return pfn >=3D pfn_offset &=
& (pfn - pfn_offset) < max_mapnr;
> > =C2=A0}
> > =C2=A0#define pfn_valid pfn_valid
> > +
> > +static inline unsigned long first_valid_pfn(unsigned long pfn)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* avoid <linux/mm.h> include hel=
l */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extern unsigned long max_mapnr;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long pfn_offset =3D ARCH=
_PFN_OFFSET;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pfn < pfn_offset)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return pfn_offset;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((pfn - pfn_offset) < max_mapn=
r)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return pfn;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (unsigned long)(-1);
> > +}
>=20
> This seems about right for FLATMEM. For SPARSEMEM it would be something
> along these lines (I kept dubious -1):

Thanks. Is that right even with CONFIG_SPARSEMEM_VMEMMAP? It seems that
it's possible for pfn_valid() to be false for a given *page*, but there
may still be valid pages in the remainder of the same section in that
case?=20

I think it should only skip to the next section if the current section
doesn't exist at all, not just when pfn_section_valid() return false?

I also wasn't sure how to cope with the rcu_read_lock_sched() that
happens in pfn_valid(). What's that protecting against? Does it mean
that by the time pfn_valid() returns true, that might not be the
correct answer any more?



> static inline unsigned long first_valid_pfn(unsigned long pfn)
> {
> 	unsigned long nr =3D pfn_to_section_nr(pfn);
>=20
> 	do {
> 		if (pfn_valid(pfn))
> 			return pfn;
> 		pfn =3D section_nr_to_pfn(nr++);
> 	} while (nr < NR_MEM_SECTIONS);
>=20
> 	return (unsigned long)-1;
> }
>=20


--=-nnwfBxLTG/70tL6apTXw
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwMTExNTAz
M1owLwYJKoZIhvcNAQkEMSIEIAAqpT3vFjeXcD2uOniW9WX5eTvvCwvWpAZEniZ/mG2tMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIApwG3aleyyaYT
wYuMIfzJPUysPoVyXlX4I+uhBMBHV7toY6Gxc/c3eLhA8oAD7ZJdOB/nZ3J3xpiUhZ6s3FJkQ1rQ
MNQB40A4r+bxQvrSx47HxtmxeBHKza5HR7KwjY2vSEjrX1s/hR4DolZiRaVc0qzA2vRrlu8vCPGJ
64IsFpf8bWMGdFanZZuRvE5Ew2zW4nPuSxndF1Qtfwkcp2gx9lsb5GnVcdJqC3rsdhCxBCOFxn67
V7IMhyhY1KPDKKSowKZ90id8PBNZFBP8MnznpvNZrGNkmQvTiALRf+tRH3C1T+Nsf8Tz7Y1CzbUS
ZndPPB/WPA6hjHy+fWc8GnwHB2EnFPkR6tffZenwuXnCc1wFtP9iHzP8JtQnI7n6o+RAPt1ZHZ2B
ktsn0lZwwFef3sjfEb3c0HSzQp32j4u47iMHhm6x3DWDOBb8pXG2bOM+30LHxsZMm7U+mIOd8MxM
v2SnZktCEd9nMalXSHNQeUWkpmXb2LmYyOOFkudKahDSkZAwiccdWdhRYvrZ7mJt+Pv+JBL6ooCg
OxYMKzJ2CnhhLJ8wCrKAbw9DX1KjZNauqsfi9TWheNZSOoNmpLzYIVul38QQS4OKwrVS0LABO9Mx
NByPZGkbPA25/jObz2VX6tRrqWNd20HZMsUEcefrflAJsfeI8A7iDuqsltYcYfYAAAAAAAA=


--=-nnwfBxLTG/70tL6apTXw--
