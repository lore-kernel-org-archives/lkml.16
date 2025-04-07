Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F86A1DFE12;
	Mon,  7 Apr 2025 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037953; cv=none; b=i4bCT3pHT+dEHxyI3T1dhhA6QzyPbd4Oy9aWipBrlnkzNCo4PNOQESOQC0k85rPZjY1GWIOTg+rEdj/TtlFs+o/JCSmhatm5x8fSbm+/TQ70uiqPhqunGnQyREJca8Sf7bssgO66CcA+4vf9q1hEYxl9Ny11Bx//GuWEAIU5JrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037953; c=relaxed/simple;
	bh=AhPmjpq0qyhSX5vVWXOFVA58oUUgjHy5WEesBT7EWSk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZFLCxzR3JtK3k2652kbbV5HnXVfgp2V5NfZnyv92lFAk/5S0XibkZIjoz8SBIBPjHR+9Yw1oRj45XIC7ZBFwFqDmLP33wVwhcyBBYCHhULUAFNefWI3kVbtmI7YRMDPC0btJh2fOmK40q187GvtQSDGN+TOsk3+VG+w/c0x57Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bJ7edHze; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bJ7edHze"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fiiz6N2vHALzfLWvzDVyDHebS2Xevm6nKgKnzMNpz7g=; b=bJ7edHzelD2Hsp+1NHmyJdTD1i
	JN99fdUcBrz1nYgxuUoK4IMU/uXjriMcP5nyms1Bh62lV7NLEZiMKZrkHshX0PjGAaaqQjgoiyjIA
	yCwpe5qmQLz/5ret7QENZN/T2Nii6mURvouuHYghHtRFQManmD01sMvxxei9KmaeMJkkHgjQrf2lk
	L98HLpOIlHLdXP57eYbtQTBS/sarJZzjTvvSysBeEFLS0iAAqdPZW/XlObKIq+IIpLCLg39PXJKWT
	CxbZkLmNe2e3jotSYKBS58gkXlSA+z3X3pUWz65h1VnGKMRITpqHACzf3/bH9vbDuM+VZLHQ/6Nga
	AnaguazQ==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nwF-0000000801w-11UA;
	Mon, 07 Apr 2025 14:59:03 +0000
Message-ID: <dec21a7dd4ba0f095009f9bf4657c5e8c0a4d9da.camel@infradead.org>
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
Date: Mon, 07 Apr 2025 15:59:03 +0100
In-Reply-To: <Z_Pb3PPIJNp4ZTjY@infradead.org>
References: <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
	 <20250404043016-mutt-send-email-mst@kernel.org>
	 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
	 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
	 <20250404062409-mutt-send-email-mst@kernel.org>
	 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
	 <Z_N_DNXq9VbPvTfA@infradead.org>
	 <f54f46399aa2d0066231d95ef9e98526cf217115.camel@infradead.org>
	 <Z_OVbRNHU1LXU368@infradead.org>
	 <c08d3fd2bdae1b0fa629ecd9261a5ca9549ce9aa.camel@infradead.org>
	 <Z_Pb3PPIJNp4ZTjY@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-X4Wvl5Dn79Iwla08Tm8+"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-X4Wvl5Dn79Iwla08Tm8+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-04-07 at 07:06 -0700, Christoph Hellwig wrote:
> On Mon, Apr 07, 2025 at 11:09:54AM +0100, David Woodhouse wrote:
> > > should be usable for all devices bar actual addressing limits that ar=
e
> > > handled in the dma layer already.=C2=A0 The only things you need is:
> > >=20
> > > =C2=A0a) a way to declare one or more pools
> > > =C2=A0b) a way to destinguish between devices behind a two stage IOMM=
U vs not
> > > =C2=A0=C2=A0=C2=A0 to figure out if they need to use a pool
> >=20
> > I'm not averse to that, but it's different to the `restricted-dma-pool`
> > model that's defined today which has explicit matching. So I'd like to
> > reconcile them =E2=80=94 and preferably literally use PRP0001 to expose
> > `restricted-dma-pool` even under ACPI.
>=20
> A per-device flag is probably fine and easier for some things like
> pool sizing.=C2=A0 It also would be worse for other things like eventuall=
y
> implementing percpu pools.

What exactly are you thinking of when you say a 'per-device' flag?

> > Maybe it's as simple as a flag/property on the `restricted-dma-pool`
> > node which declares that it's a 'catch-all', and that *all* devices
> > which aren't explicitly bound to an IOMMU or other DMA operations (e.g.
> > explicitly bound to a different restricted-dma-pool) should use it?
>=20
> Yeah.=C2=A0 Similar what we do with the generic shared-dma-pool.

Yeah, I was trying to work that one out, and it looks like I'm almost
describing the 'linux,dma-default' property. Except that seems to be
only for coherent allocations on the `shared-dma-pool`.

Maybe it makes sense for 'linux,dma-default' on a restricted-dma-pool
to mean that it should be used as a swiotlb for *all* DMA?

I don't much like the "linux," prefix but can live with that if that's
the precedent.

> > Either way, we'd still ideally want a virtio feature bit to say "don't
> > touch me if you don't understand my DMA restrictions", to prevent older
> > drivers (on older operating systems) from failing.
>=20
> As said before they really need system level awareness of a coco host.
> That's not something to be hacked into virtio drivers.

Nah. As long as they use the IOMMU they're offered, guests don't need
any awareness at all that they're running in an environment where the
VMM can't access all their memory. There is precisely *zero* enablement
required in the guest for that.

The only problem is virtual devices which are provided by that VMM.

If the guests *do* have system level awareness of the particular
variant of CoCo host they're running on, then sure, they can explicitly
manage sharing/encryption/whatever with a system-specific set of DMA
operations and the problem goes away. But that's a long way off.

How does this sound as a plan...

 1. Define 'linux,dma-default' on a 'restricted-dma-pool' object to
    mean that it should be used as a fallback SWIOTLB for *all* devices
    (basically, as if each device explicitly referenced it as they do
    today).

 2. Provide a way to represent `restricted-dma-pool` in ACPI (which
    ought to work naturally as PRP0001 and it's mostly a matter of
    untangling it from OF-specific code on the guest side).

 3. Add a VIRTIO_F_RESTRICTED_DMA feature to virtio, so that devices
    which *know* they have such a limitation can gracefully decline
    to operate with a driver which doesn't support it.

 4. Add a way for a virtio-pci device to explicitly reference a given
    `restricted-dma-pool` like virtio-mmio devices can today. And it
    probably makes sense for a virtio-pci device which requires the
    VIRTIO_F_RESTRICTED_DMA feature to explicitly reference such a
    pool even if that pool has the `linux,dma-default' property?

With #1 and #2 we provide this facility even for passthrough PCI
devices. And with #3 and #4 we make it work *better* for virtio, which
is the more important use case (since those two-stage IOMMUs *do* exist
in the cases of CoCo-supporting hardware; it's just that they don't
enable *virtual* devices).


--=-X4Wvl5Dn79Iwla08Tm8+
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwNzE0NTkw
M1owLwYJKoZIhvcNAQkEMSIEIP6sJUbRW0GlvzpC/r6n5S7LEcPHMgaCvQmD6qegYObbMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAeOgGgm5JHwbM
nmZwyFimIefatdf+PWA7USobHXrEOkohFkDzhGqp4zeBtlYoncqPyfULjG2ByZMq0ynNTaXc1eTZ
ECGIz6aowG4rXmShUUBgIm8kIPrXUhwx/5DTatJ2p7VmnEYMV3gK419yCQemZv6gRzRjykXgEq36
jz24SNGRXk/VNnosmpLGiiqAadXLHeXFSTw4ApW0JLKEdXi0MUqNV/4LuqF0xP0XViQ9uNaRBche
8c9wzBEM1FM8urMCo3Gw+BpkhFP2eVBClPiBUH8qdOY/7GBwVcqgqtgjBxcDh7rXA+Qxt5xqZM0t
URHArlZHAfO6YDBP00accu689qliy9jMeytCe+QeISZXVGvDF0n9lxg6FPNfKvspduVorfuZqovo
2NK1T9Kfd84wQHfnKDEiQzaIb+GaZf0PH5v8Kz9zxMthp9yBhAZW0okSgFFLdq/m1371yqXpooiY
1DXpgNoJY0g/yssjFz1K0HqjW5LuQkwxeA0odWtU3zccmCTw23Q1LOwyC+rGNEVqEYNju74/p2xh
FA32fQOItxUNMpBNik0id/e2lc+tqPIws4i458eZJ11E87N3IuCMMgGEVMBtXhmMoFRiUDGfo3Of
AG6car0INyNwhgrj9Q1IRNdYbfCaI5yLuxVaqBurGV1ZTVQaRm3kvt7E2oETDWQAAAAAAAA=


--=-X4Wvl5Dn79Iwla08Tm8+--
