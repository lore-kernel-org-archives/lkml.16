Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033D218AC4;
	Mon,  7 Apr 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744020599; cv=none; b=Inigdz0BiuyNyULsRaQ7RcDjtiZqgAoEZeKqlS/wevipkUooV++1kMh10UhwHCv3meHcDlK7mCrTgjsR1r6H8Q3l643WzHUHYqxjaCU4kiYbTXEhsF83tV6CuwbT7ostvD4XEjvnUxayLmmay0cBdPs/Ne0B9Ln6mPlvb70lUZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744020599; c=relaxed/simple;
	bh=M6WnzkYenlIn57uFafdO38TmD6Yh8ssUEMKXuiqGTuI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bg4EB58BXO2eO76i4paKrlpYweCDguf50qJVIZmz//HgJwh+APg9EPxiURiNW4l+L0qhHlWRAstIsdx/ahXIGKOEODgja/PIiTWjG5Ti+jVxSlVa+CE6aZGG1PWLLIH0vz6zph+HfoSvmYQwsK+w0rRT2ISwbfPYkY0RtFtOZtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T4zbsC15; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T4zbsC15"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M6WnzkYenlIn57uFafdO38TmD6Yh8ssUEMKXuiqGTuI=; b=T4zbsC156torLTTTwAKsNOwDno
	as2bWDS4arlz9nNVJx0V/AQqcboL2Jzm+Up9C25Fq1lYfxLX/MMLUqC2gZX/ViBwZxbr0SUt4BaXg
	sWz6CZPSF8/aQLWK5+yfbugji3jQqGhW0MuXeKJTZDN10FwyPs1LgCiPDxRh2GK9P2NlGvSeHWTjL
	j2ZUQ2xcUMUXQcO8ZoSvGSZWVN0sBL2mx9mQ1GXoATmBrA78jA0tgeF8kZZCqoQIAYMSG0tZ9n7Xw
	zQ0LwjQe0YGISXNaSzmF7cLL8qpRD676iZWZ84xm/YB703NBJwxzHWISjI+EpAn8n4VZMDnYORCua
	/V64inhg==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jQQ-00000007uTt-3CKQ;
	Mon, 07 Apr 2025 10:09:55 +0000
Message-ID: <c08d3fd2bdae1b0fa629ecd9261a5ca9549ce9aa.camel@infradead.org>
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
Date: Mon, 07 Apr 2025 11:09:54 +0100
In-Reply-To: <Z_OVbRNHU1LXU368@infradead.org>
References: <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
	 <20250404040838-mutt-send-email-mst@kernel.org>
	 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
	 <20250404043016-mutt-send-email-mst@kernel.org>
	 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
	 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
	 <20250404062409-mutt-send-email-mst@kernel.org>
	 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
	 <Z_N_DNXq9VbPvTfA@infradead.org>
	 <f54f46399aa2d0066231d95ef9e98526cf217115.camel@infradead.org>
	 <Z_OVbRNHU1LXU368@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-hlQ3IWlfGR23wGSd2PXd"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-hlQ3IWlfGR23wGSd2PXd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-04-07 at 02:05 -0700, Christoph Hellwig wrote:
> On Mon, Apr 07, 2025 at 08:54:46AM +0100, David Woodhouse wrote:
> > On Mon, 2025-04-07 at 00:30 -0700, Christoph Hellwig wrote:
> > > On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
> > > > We could achieve that by presenting the device with a completely ne=
w
> > > > PCI device/vendor ID so that old drivers don't match, or in the DT
> > > > model you could make a new "compatible" string for it. I chose to u=
se a
> > > > VIRTIO_F_ bit for it instead, which seemed natural and allows the
> > > > device model (under the influence of the system integrator) to *cho=
ose*
> > > > whether a failure to negotiate such bit is fatal or not.
> > >=20
> > > Stop thinking about devices.=C2=A0 Your CoCo VM will have that exact =
same
> > > limitation for all devices, because none of them can DMA into random
> > > memory.
> >=20
> > Nah, most of them are just fine because they're actual passthrough PCI
> > devices behind a proper 2-stage IOMMU.
>=20
> Except for all virtual devices.

Yes, that's what I'm saying.

And that's also why it's reasonable to have a solution which handles
this for virtio devices, without necessarily having to handle it for
*arbitrary* emulated PCI devices across the whole system, and without
having to change core concepts of DMA handling across all operating
systems.

This isn't just about Linux guests, and especially not just about Linux
guests running running 6.16+ kernels.

A solution which can live in a device driver is a *lot* easier to
actually get into the hands of users. Not just Windows users, but even
the slower-moving Linux distros.

> > > > Then the OS would need to spot this range in the config space, and =
say
> > > > "oh, I *do* have a swiotlb pool this device can reach", and use tha=
t.
> > >=20
> > > Yes, that's largely how it should work.
> >=20
> > The problem in ACPI is matching the device to that SWIOTLB pool. I
> > think we can expose a `restricted-dma-pool` node via PRP0001 but then
> > we need to associate a particular device (or set of devices) to that
> > pool. In DT we do that by referencing it from a `memory-region` node of
> > the device itself.
>=20
> I don't think you actually _need_ to have an explicity device vs pool
> match.=C2=A0 All pools in host memory (assuming there is more than one)
> should be usable for all devices bar actual addressing limits that are
> handled in the dma layer already.=C2=A0 The only things you need is:
>=20
> =C2=A0a) a way to declare one or more pools
> =C2=A0b) a way to destinguish between devices behind a two stage IOMMU vs=
 not
> =C2=A0=C2=A0=C2=A0 to figure out if they need to use a pool

I'm not averse to that, but it's different to the `restricted-dma-pool`
model that's defined today which has explicit matching. So I'd like to
reconcile them =E2=80=94 and preferably literally use PRP0001 to expose
`restricted-dma-pool` even under ACPI.

Maybe it's as simple as a flag/property on the `restricted-dma-pool`
node which declares that it's a 'catch-all', and that *all* devices
which aren't explicitly bound to an IOMMU or other DMA operations (e.g.
explicitly bound to a different restricted-dma-pool) should use it?

That's actually what of_dma_configure_id() does today even with the
existing `restricted-dma-pool` which *is* explicitly matched to a
device; the pool still only gets used if of_configure_iommu() doesn't
find a better option.

But I would also be entirely OK with following the existing model and
having the virtio device itself provide a reference to the restricted-
dma-pool. Either by its address, or by some other handle/reference.

Referencing it by address, which is what Michael and I were discussing,
is simple enough. And in this model it *is* a device restriction =E2=80=94 =
that
virtio device knows full well that it can only perform DMA to that
range of addresses.

And it also allows for a standalone device driver to go check for the
corresponding ACPI device, claim that memory and set up the bounce
buffering for *itself*, in operating systems which don't support it.
Although I suppose a standalone device driver can do the same even in
the 'catch-all' model.

Either way, we'd still ideally want a virtio feature bit to say "don't
touch me if you don't understand my DMA restrictions", to prevent older
drivers (on older operating systems) from failing.

(I know you say that's a 'restriction' not a 'feature', but that's just
fine. That's why it's a *negotiation* not simply the device advertising
optional features which the driver may choose to use, or ignore, as it
sees fit.)

--=-hlQ3IWlfGR23wGSd2PXd
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwNzEwMDk1
NFowLwYJKoZIhvcNAQkEMSIEIMbVRkU829NnMrSc3/aoLCl4hTaB0+7exKxiO34xN7R0MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIACFjzbfpLQT+g
/nOQ0PMQticz/FHqyngzbr/z4hCwSAaP23PfN6jLdx8OMMxccH18yY60SCOnIVdz6oK2/oor8zOK
7LJyPa4sc3T9Pm/x6Ad/ynaBlNAu2+gcTJ8yTXrDyIdm2zJlFD1KnEmpCw4VwOxEHAoaMTlhGflk
bLgbhWxC64V87LJkf5ev/cTXUaO09zDq3cuP1CngCdJuyLVqcQqFPMrASoGRrneLIrT8s2xvTwfU
s3Uf+I9CGdRfVFMn5Aye9j1fYcFZdSrreUCpy4tIexiFjNRv9ZmJQGp+OpRbXb1PKg+2vcgF/sJZ
XWv+uo4zlRzJ5f4LLbMVll/EyhfJgMI7faslHhpedbFllnGStx7XAyqkrkzVqEGbUdzbsN/4argb
HsLbq4sB/qDNYd687Kisf9w5HA8XA8KQVc8706SPjk0UxZLN4m2rOYar2kEQYvX+kdUB7NK92M21
1MvxEB01UwqD149OgEL4UG1/taKMA0gsopk7GJbHZGCKqbYB63/KEfzbGoAGzMgZsGMrzap1gSpw
vX2lvMD1YrqVBvzJYnRLlkrGsGgGFhQV8auWYBMtqG7s+xh8pqlqvaTEGXNRhZPGZOAI5UU1TLrX
5HqMCt1U2KCGTvzW5qcKPtJp3Lebp99WVC7Ng/FP+EnudYKB0WGAY7ASryG+zzUAAAAAAAA=


--=-hlQ3IWlfGR23wGSd2PXd--
