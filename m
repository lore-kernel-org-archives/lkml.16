Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FB510E9;
	Fri,  4 Apr 2025 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743761740; cv=none; b=PdciVEZJ2sJhNVaAxEh1tcl58WtaGTFozpA3meTNbSjLPEPUEo2SZqJA+xhjDucLnBRIm1o5i3Jb8HyajvfGB8Qz8zXZU8jD41EgkEraTmr2unpkGQC6/3W/XHE6LPSxPAAOHIFVdCxue29waYHppZIiK4WqH4yYirbzaI9o1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743761740; c=relaxed/simple;
	bh=FIhdnMy1wVCQl+snoKJDk1zz7zUQjIeLWe8MEZU/l88=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ht933p39//9PKzwUsNLpZHQo2cXCWbhCtELbR8qcLq5QsMHPhB6O/QBd5ddgabD1Sv3GWmov4R6gIyGJMn2tzOvhylnwUCfRU6rdwcw43rPxSoVrwOLCE6Bjzhl5ANCfimH/l/95rXoweyyNe/PUjfUHwRCP3w5JNAh/eESxOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Pna6zNuo; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Pna6zNuo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FIhdnMy1wVCQl+snoKJDk1zz7zUQjIeLWe8MEZU/l88=; b=Pna6zNuozP37PPqW/6nfYt0ElJ
	f9/JDraDU6IiDT3H4fDSgHExqb5UH2OaqbbOzHMd8+lW2zMS3p1I0ZTjmQNTluYrOfPMG9HIKnHO8
	NoMc4TgNzEYYXi8w/rOTGfUCXF+R3C9MQvFJJRqbeepiH5qZBrz0nzEr6OQv9nIYRRwuoqeVsdyKv
	EC7P9VtWwF80OINIhJF2D/Jk7oBbJ8lfOfzsrnQkbEfu7rVvbl17q5eFDYLvaY+hI98rVnNQC7lK8
	1zJnWwqWdD7J/1NwAAPeSqC0BwD5ytnxORdQ12rIJBavtcOd4R+69ph6nyHccR8pkriWfJ/mRN8hI
	6IdMDeTQ==;
Received: from [193.117.214.244] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0e5G-00000007Nzp-1oJn;
	Fri, 04 Apr 2025 10:15:34 +0000
Message-ID: <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>, virtio-comment@lists.linux.dev, 
 Claire Chang <tientzu@chromium.org>, linux-devicetree
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 =?ISO-8859-1?Q?J=F6rg?= Roedel <joro@8bytes.org>, 
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 graf@amazon.de
Date: Fri, 04 Apr 2025 11:15:33 +0100
In-Reply-To: <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
	 <20250402112410.2086892-2-dwmw2@infradead.org>
	 <Z-43svGzwoUQaYvg@infradead.org>
	 <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
	 <Z-46TDmspmX0BJ2H@infradead.org>
	 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
	 <Z-99snVF5ESyJDDs@infradead.org>
	 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
	 <20250404040838-mutt-send-email-mst@kernel.org>
	 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
	 <20250404043016-mutt-send-email-mst@kernel.org>
	 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-LpiL4yUyZM4+bvlzehPS"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-LpiL4yUyZM4+bvlzehPS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-04-04 at 10:27 +0100, David Woodhouse wrote:
> On 4 April 2025 09:32:39 BST, "Michael S. Tsirkin" <mst@redhat.com>
> wrote:
> > On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
> > > On Fri, 2025-04-04 at 04:09 -0400, Michael S. Tsirkin wrote:
> > > > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse
> > > > wrote:
> > > > > What's annoying is that this should work out of the box
> > > > > *already* with
> > > > > virtio-mmio and a `restricted-dma-pool` =E2=80=94 for systems whi=
ch
> > > > > aren't
> > > > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms.
> > > >=20
> > > >=20
> > > > That specifically would be just a driver bugfix then?
> > >=20
> > > I actually think it works out of the box and there isn't even a
> > > bug to
> > > fix. Haven't tested yet.
> > >=20
> > > The sad part is that the system does it all automatically *if* it
> > > has
> > > CONFIG_DMA_RESTRICTED_POOL (e.g. Linux) and the driver never even
> > > notices that the dma_ops it's using are the swiotlb ops using the
> > > provided buffer.
> > >=20
> > > Which is *kind* of nice... except that when on a guest OS which
> > > *isn't*
> > > Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore
> > > the
> > > `restricted-dma-pool` node and try DMA to system memory anyway,
> > > which
> > > will fail.
> >=20
> > I mean, it's easy to misconfigure Linux, this is why we love it ;)
> > Why
> > is this such a concern?
>=20
> Because it's incompatible. In the DT world, perhaps this new *non-
> optional* feature/restriction should have come with a new
> "compatible" string such as "virtio-mmio-restricted-dma".
>=20
> Adding it without backwards compatibility wasn't ideal.
>=20
> > > That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB
> > > feature, so
> > > that the device side can refuse, if the guest *isn't* agreeing to
> > > use
> > > the bounce buffer in the situations where it must do so.
> >=20
> >=20
> > OTOH then setting this feature and if you make the device force it,
> > you are breaking guests restricted-dma-pool which worked
> > previously, no?
>=20
> Yes. So a platform offering virtio-mmio with restricted DMA, if the
> driver doesn't accept the offered VIRTIO_F_SWIOTLB, may want to
> accept that negotiation anyway, and *hope* that the driver/OS are
> going to use the buffer anyway.
>=20
> I just didn't want to make that same mistake again when formalising
> and documenting this, and especially when attempting to extend it to
> PCI.

Of course, the beauty of the restricted-dma-pool as supported by DT is
that it's a *system* memory buffer, which is actually OK as long as
it's reserved address space and not just part of normal system memory
that an unsuspecting guest might use for general purposes. So the
trusted part of the hypervisor (e.g. pKVM) can *allow* the VMM access
to that space.

It doesn't *have* to be on-device. That just seemed like the more
natural way to do it for PCI.

I suppose we *could* allow for the virtio-pci transport to do it the
same way as virtio-mmio though. The VIRTIO_PCI_CAP_SWIOTLB capability=C2=B9
could reference a range of system memory space, just like the
`restricted-dma-pool` property does.

It's a weird abstraction especially for a physical PCI device to do
that because the system memory space is outside its ownership. But in a
physical device it could be writable, and you could consider it the
responsibility of the system firmware to configure it appropriately, in
accordance with the IOMMU and other DMA restrictions of the platform.

That does solve it for the CoCo case without addressing the P2P staging
case that Christoph mentions, though.


=C2=B9 I will rename it, Christoph, if it survives at all. Probably
VIRTIO_F_RESTRICTED_DMA and VIRTIO_PCI_CAP_RESTRICTED_DMA but of course
it depends on the semantics we conclude it should have.

--=-LpiL4yUyZM4+bvlzehPS
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwNDEwMTUz
M1owLwYJKoZIhvcNAQkEMSIEIAMhrHLxtL1DfO48u1RVbVg+bCuZb81p3mVzhtuCHUcHMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIARpy0evJlT77M
YhhfuXyYU1ygnnyZbEDAgujHdYaRDr+IEPrY6F6snRzMQGa8iHB/KuP6h1omDAKJxTwS6jm6jhwR
Vw4iRW92+BhcYjZJMem9OtkZbZ1FWbUaEo5Zp4U7Dz61aTq1l0PpyERSQo3I3UMzSlK+9barn7zy
iQC04taPIigw8deX3NQaz9G0LP4X3SEAvWrxMwpZn8MR2/iSbfYMC3A83n9FYHmiHHMAhaxoYMGS
yZTrEbaYhlkWm2mou4Fa9c0jE9+XQXxFVprv8qJDKluQQ8xAo6ZFGghwu7h5XWyMXbGGlrMnndEo
yG6z7kFF4mbyKPiRSSoC1w6bxEv15i1GxBrizz/kbiRKeOBZGYMBMVY7hka8LP54rMWvcjp5z5Sr
soMbMH7sDUbyWvlzBmUddYajrjwa4WLDm8N+FVFSE9dleWvCW8Pf/WqMDY7h8OY5By4jskNpwfU2
Wu9KxKkhcd9cXPDtxrxAWPRPW65Iq0r8gd/Z9o+SPRso7jVwEHwT//2WhCuKJoX473DyYUPkcfp1
IQwLx2XJYtYmQHII62VQc9Mmlmbd6VQ8gyreb0i5GOslycJ6HefYaZ7/txFcOIntnsSoKAIVGH+R
arBwRae0VIeC1TmrlQHWWjnym+6HHGH8X+jw6UR7jU1U0lE2MYJqOwHilIOBJEwAAAAAAAA=


--=-LpiL4yUyZM4+bvlzehPS--
