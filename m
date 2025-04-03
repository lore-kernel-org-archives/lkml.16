Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6A31F03FF;
	Thu,  3 Apr 2025 07:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665845; cv=none; b=uX4iQzMxNfLL/dpgFXIRdWr6vtdNdySnBxlWboB0j3CTaI9iazn/kcGbNTXC519+HwVIqe+mzkEzi72/dfxYAKupnrRTl3pahSwWhh1mnrSn/2sh1hIGR3T9uYaWAJqbIZz6RzG37KZIR+hatZAYT99TV3WtRy6byhu87t4F+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665845; c=relaxed/simple;
	bh=daFrifOQnUKqeZLt8gCXV2HXtiu3gXL2lFRtxnrujnY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hj+XbRfEcb3OqfTbjXx2VyzptRL2VA1o3dBX2hJ0ahZSrNaMCNbnocRdI2jjIqHLINmeyI3wIVSipIjoBcoj5vXSc/zOXrxer7R0xQ+Kn2MHneS4ENZ0czw9GcL9sFTe3aJQ9Xt5oIBaauKbWa8eZVkyL3WFi82s/wPhjQQeats=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=k4B7cm1n; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k4B7cm1n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=daFrifOQnUKqeZLt8gCXV2HXtiu3gXL2lFRtxnrujnY=; b=k4B7cm1nXXePYINmwme71EL0ek
	pb/7Nr8ovYbyU8QvSO4Olza34/mRdxUHBzUrtUsXz93EHGGX+odG4WIWcpPTyHfyrqW3Y70OYaWmH
	XLI11YQypK5gk3+99lqKGDrzj38JVCwnYvWoSA7LV59Ptdm0m3uuq6II6bL3FOJdglreV/KjjcmfK
	J/g8lvI4k+WkVdYUt/Qw4TB9cP5RTMoJk0jsHBUi1y330otVp8B8pzWNj70fJINmb94CfXkVO8mDq
	rYvurHu37lyA2HksLHwb4hhZTHGkKh7Jl7l9P1ft+EZXLFEJqQd2UTRu6Riay/DcYD3Akyt8MC5wq
	lMzFnPvg==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0F8a-000000079Kd-0t3e;
	Thu, 03 Apr 2025 07:37:20 +0000
Message-ID: <06465bcf4422d088df2a0ce9cdb09767dac83118.camel@infradead.org>
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
From: David Woodhouse <dwmw2@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.linux.dev, 
 Claire Chang <tientzu@chromium.org>, linux-devicetree
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 =?ISO-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>, 
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 graf@amazon.de
Date: Thu, 03 Apr 2025 08:37:20 +0100
In-Reply-To: <Z-44wXdyia4RC6Cr@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
	 <20250402112410.2086892-2-dwmw2@infradead.org>
	 <20250402105137-mutt-send-email-mst@kernel.org>
	 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
	 <20250402111901-mutt-send-email-mst@kernel.org>
	 <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
	 <20250402114757-mutt-send-email-mst@kernel.org>
	 <965ccf2f972c5d5f1f4edacb227f03171f20e887.camel@infradead.org>
	 <20250402124131-mutt-send-email-mst@kernel.org>
	 <eaef09ab218900a53347987a62fee1787283d9ed.camel@infradead.org>
	 <Z-44wXdyia4RC6Cr@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-Dm2IGgDpk0mwAvqmmjXg"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-Dm2IGgDpk0mwAvqmmjXg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-04-03 at 00:29 -0700, Christoph Hellwig wrote:
> On Wed, Apr 02, 2025 at 06:10:53PM +0100, David Woodhouse wrote:
> > > I know a bit more about PCI, and for PCI I prefer just not saying
> > > anything. The platform already defines whether it is behind an iommu
> > > or not, and duplication is not good.
> >=20
> > Not a hill for me to die on I suppose, but I would personally prefer to
> > spell it out in words of one syllable or fewer, to make *sure* that
> > device and driver authors get it right even though it's "obvious".
> >=20
> > After all, if we could trust them to do their thinking, we would never
> > have had the awful situation that led to VIRTIO_F_ACCESS_PLATFORM
> > existing in the first place; the legacy behaviour we get when that bit
> > *isn't* set would never have happened.
>=20
> You'll need to define the semanics for VIRTIO_F_ACCESS_PLATFORM only
> then.=C2=A0=C2=A0
>=20

You mean the semantics for VIRTIO_F_ACCESS_PLATFORM only, without
VIRTIO_F_SWIOTLB? Are those not defined already?

> An the only sane answer there is: don't allow non-translated
> regions at all an in a broader sense stop people to use
> VIRTIO_F_ACCESS_PLATFORM at all or at least for anything that requires
> a new feature bit.
>=20
> > > For mmio it is my understanding that the "restricted" does the same
> > > already? or is it required in the spec for some reason?
> >=20
> > No, it's exactly the same. But I still don't trust driver authors to
> > realise the obvious, or VMM implementations either for that matter.
> >=20
> > I'm not sure I see the *harm* in spelling out explicitly for the hard-
> > of-thinking.
>=20
> Write a whitepaper than and explain how it maps to the existing perfectly
> working features.=C2=A0 Note that VIRTIO_F_ACCESS_PLATFORM just like
> everything in virtio would actually benefit from being turned into
> proper spec language, but anecdotes about random use cases are not
> helpful.

Hm. I was just trying to point out what seemed obvious, that when a PCI
device does 'DMA' to an address region which is actually within one of
its *own* BARs, it isn't going to reach the PCI bus and get translated
by an IOMMU. If it's causing this much contention, I'll just drop it.
It didn't *change* anything anyway, except hopefully avoiding bugs in
implementations.


--=-Dm2IGgDpk0mwAvqmmjXg
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwMzA3Mzcy
MFowLwYJKoZIhvcNAQkEMSIEIMtmfsqeCX9N3qgevLASUxzm1ZvQaBwhvaUDNH4OX9jdMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIANRbeHrxM4Oiz
V4pAnEXbF64INvM88AImr8IahqJywmQwCknr4QWHLWbWG95yoINWDu8OsI8zJqto2j00Z/L8Tsk2
Y89UBROmLC0Zz6vedrqtmxe/0otSWRi8UQckRsdGcegQn/AEJxAI6qQ5HzKJEozmKoXnpf4mSHjo
7vlKQ6GpX8zTwbkolZjX0M4gIJRzEuhRU9vqkJVP8GS0THTtKqFpHrENtXR0Gb7yqJwyTgHDpgk3
zkbiXBjG1NZku6jLmASycQVXrE8Z71tASqRiaFGUnl+pCrkf2JuMTzT4JmiMpmBLMEEnCzfvLlEK
2L0DbLOQuFlC1XVv6irUyRors1whBrqckM3WQCi7ruFV1/N68ic1ae33gGlKM0brXzZmStWruAQM
tEZAfZAJor6XPv+Id/xeZH5ehH9Nl6KNG5OID8EJ/RXwUkfrCgADVc9bErrkp3qffvdLGpaJo1Cf
9mGc87rM5pO7u/CiKxq/aQOAsSaF61bhaCCbpTd7dvu6e2nros0sscbjhB1EnWX1dwkyQA7LF7WG
CJ9CT2jrVLMmf5XYvB+t+7Btn+ZSRlmjoAeT5K+nj8UuI3/3JWpanxw7y63u8DabFyq2Hyann3Fo
7t0bT+MPcMV52KmcQJ9zedpIjSi9L/qdJ7EznXARgarUoTMXM8ENzXQ4fAwunXoAAAAAAAA=


--=-Dm2IGgDpk0mwAvqmmjXg--
