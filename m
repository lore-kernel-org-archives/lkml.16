Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5D1922FA;
	Fri,  4 Apr 2025 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765358; cv=none; b=FjL9DItfHRwAuENFNJxfhnNGjDU71bTZGMdV+sUGdtjgSQuL9gTxoIGkseAjUG2WxtpMSKGZz2OFSV15R5YlrIcMRKWDbZTZcnkIvQRvX3v3I8IF2uGsk6R5a/q/7oHazD8hZDB7hwJbW765l3XUpNGcHlesxPdjJIqDGXLByjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765358; c=relaxed/simple;
	bh=bYRo3EIM40Fz8EMmf1PkpWWLvxuKBj2tqbBayDFeRsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lhBfPr0cQuixDdRnyVMLsc/9idwdwpBzVh4wPYeyN4nb2sJDWQ1plsyX0x1DDVh13vW1BUEnLANNIVMuTkO4o0V0mvQqwn1fS0+9yj/PR9YqMPYdD/uXNK/S2f0QnTsh2u3xdLXeCdP3Ft7MFDLjp+nIL2aaKa5j6hmjyv0aE40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Lrvmbi7/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Lrvmbi7/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bYRo3EIM40Fz8EMmf1PkpWWLvxuKBj2tqbBayDFeRsI=; b=Lrvmbi7/FOdWkx6Jr3SdschV5R
	RZ+leOE1h0/l2+04h+9WiaWCwIh8QBgxzNHuVQdoLB+VKjKrCgblDwU/lsXVVVuvMR+xr8hPtAWq4
	zdFUdMi6tLOiHanZgE9l6gZ1b30cDx2agczmPPbxnz8aa8+VGhWD3ji12Pj9W2QlBcTf3A1OTBXMT
	P1NkGpH3SuP0H+Wbis6qskXC8hU0lJhtn4QsqOxYaQX5oH5ARPTOh6XfiOHha303OoPXCQpOr0y/m
	d0P5ufEUnTnTyp3Y0kyHmuW3Q2m3U0now/GazMoW62udZ4Ak6Apebq1yXyjczums00ChigxU0BOgr
	q6OmDQNQ==;
Received: from [193.117.214.244] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0f1d-00000007OPS-1eee;
	Fri, 04 Apr 2025 11:15:53 +0000
Message-ID: <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
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
Date: Fri, 04 Apr 2025 12:15:52 +0100
In-Reply-To: <20250404062409-mutt-send-email-mst@kernel.org>
References: <148a3c8ee53af585b42ec025c2c7821ad852c66c.camel@infradead.org>
	 <Z-46TDmspmX0BJ2H@infradead.org>
	 <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
	 <Z-99snVF5ESyJDDs@infradead.org>
	 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
	 <20250404040838-mutt-send-email-mst@kernel.org>
	 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
	 <20250404043016-mutt-send-email-mst@kernel.org>
	 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
	 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
	 <20250404062409-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-I5Ft7d1drvT8B/fLmD1B"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-I5Ft7d1drvT8B/fLmD1B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-04-04 at 06:37 -0400, Michael S. Tsirkin wrote:
> On Fri, Apr 04, 2025 at 11:15:33AM +0100, David Woodhouse wrote:
> > On Fri, 2025-04-04 at 10:27 +0100, David Woodhouse wrote:
> > > On 4 April 2025 09:32:39 BST, "Michael S. Tsirkin" <mst@redhat.com>
> > > wrote:
> > > > On Fri, Apr 04, 2025 at 09:16:44AM +0100, David Woodhouse wrote:
> > > > > On Fri, 2025-04-04 at 04:09 -0400, Michael S. Tsirkin wrote:
> > > > > > On Fri, Apr 04, 2025 at 08:50:47AM +0100, David Woodhouse
> > > > > > wrote:
> > > > > > > What's annoying is that this should work out of the box
> > > > > > > *already* with
> > > > > > > virtio-mmio and a `restricted-dma-pool` =E2=80=94 for systems=
 which
> > > > > > > aren't
> > > > > > > afflicted by UEFI/ACPI/PCI as their discovery mechanisms.
> > > > > >=20
> > > > > >=20
> > > > > > That specifically would be just a driver bugfix then?
> > > > >=20
> > > > > I actually think it works out of the box and there isn't even a
> > > > > bug to
> > > > > fix. Haven't tested yet.
> > > > >=20
> > > > > The sad part is that the system does it all automatically *if* it
> > > > > has
> > > > > CONFIG_DMA_RESTRICTED_POOL (e.g. Linux) and the driver never even
> > > > > notices that the dma_ops it's using are the swiotlb ops using the
> > > > > provided buffer.
> > > > >=20
> > > > > Which is *kind* of nice... except that when on a guest OS which
> > > > > *isn't*
> > > > > Linux with CONFIG_DMA_RESTRICTED_POOL, the guest will just ignore
> > > > > the
> > > > > `restricted-dma-pool` node and try DMA to system memory anyway,
> > > > > which
> > > > > will fail.
> > > >=20
> > > > I mean, it's easy to misconfigure Linux, this is why we love it ;)
> > > > Why
> > > > is this such a concern?
> > >=20
> > > Because it's incompatible. In the DT world, perhaps this new *non-
> > > optional* feature/restriction should have come with a new
> > > "compatible" string such as "virtio-mmio-restricted-dma".
> > >=20
> > > Adding it without backwards compatibility wasn't ideal.
> > >=20
> > > > > That's why my proposal adds the negotiated VIRTIO_F_SWIOTLB
> > > > > feature, so
> > > > > that the device side can refuse, if the guest *isn't* agreeing to
> > > > > use
> > > > > the bounce buffer in the situations where it must do so.
> > > >=20
> > > >=20
> > > > OTOH then setting this feature and if you make the device force it,
> > > > you are breaking guests restricted-dma-pool which worked
> > > > previously, no?
> > >=20
> > > Yes. So a platform offering virtio-mmio with restricted DMA, if the
> > > driver doesn't accept the offered VIRTIO_F_SWIOTLB, may want to
> > > accept that negotiation anyway, and *hope* that the driver/OS are
> > > going to use the buffer anyway.
> > >=20
> > > I just didn't want to make that same mistake again when formalising
> > > and documenting this, and especially when attempting to extend it to
> > > PCI.
> >=20
> > Of course, the beauty of the restricted-dma-pool as supported by DT is
> > that it's a *system* memory buffer, which is actually OK as long as
> > it's reserved address space and not just part of normal system memory
> > that an unsuspecting guest might use for general purposes. So the
> > trusted part of the hypervisor (e.g. pKVM) can *allow* the VMM access
> > to that space.
> >=20
> > It doesn't *have* to be on-device. That just seemed like the more
> > natural way to do it for PCI.
> >=20
> > I suppose we *could* allow for the virtio-pci transport to do it the
> > same way as virtio-mmio though. The VIRTIO_PCI_CAP_SWIOTLB capability=
=C2=B9
> > could reference a range of system memory space, just like the
> > `restricted-dma-pool` property does.
> >=20
> > It's a weird abstraction especially for a physical PCI device to do
> > that because the system memory space is outside its ownership. But in a
> > physical device it could be writable, and you could consider it the
> > responsibility of the system firmware to configure it appropriately, in
> > accordance with the IOMMU and other DMA restrictions of the platform.
> >=20
> > That does solve it for the CoCo case without addressing the P2P staging
> > case that Christoph mentions, though.
> >=20
> >=20
> > =C2=B9 I will rename it, Christoph, if it survives at all. Probably
> > VIRTIO_F_RESTRICTED_DMA and VIRTIO_PCI_CAP_RESTRICTED_DMA but of course
> > it depends on the semantics we conclude it should have.
>=20
> OK. So basically, all this does, is a promise by driver to only
> DMA into a range of memory?

Basically, yes.

> This part, I get. I wouldn't put it in a capability, just in config
> space then.

Sure... but how? There are some things which are defined to be at fixed
locations in config space, like the vendor/device IDs, COMMAND, STATUS,
BARs, etc..

And for the rest of the optional things which might be in config space
of a given device... isn't that exactly what capabilities are for?

> What I don't get, is what does the *device* want, exactly?

The device wants to know that a driver won't try to use it without
understanding the restriction. Because otherwise the driver will just
give it system addresses for DMA and be sad, without any coherent
error/failure report about why.

(You could ask the same question about what the *device* wants with
VIRTIO_F_ACCESS_PLATFORM, and the answer is much the same).

Or maybe not the *device* per se, but the *system integrator* wants to
know that only operating systems which understand the restriction
described above, will attempt to drive the device in question.

We could achieve that by presenting the device with a completely new
PCI device/vendor ID so that old drivers don't match, or in the DT
model you could make a new "compatible" string for it. I chose to use a
VIRTIO_F_ bit for it instead, which seemed natural and allows the
device model (under the influence of the system integrator) to *choose*
whether a failure to negotiate such bit is fatal or not.

> Here's a vague idea to explain the question:
>=20
> some embedded devices can have addressing restrictions, such
> as the number of bits of an address.
> In another example, the legacy balloon device only supports addresses
> up to 48 bit.
> These can still be useful if driver does not use the inaccessible
> addresses.
>=20
>=20
>=20
> So far so good? Does this look like a generalization of your idea?

Makes sense.

> Now, a question: DMA API under linux at least, can actually work
> around device limitations using a bounce buffer. It does, however,
> need to know what to work around.
> So, maybe the device needs to expose a range?
> But what is the range in your case?

The main thing in the CoCo case is that the range in question must not
contain any memory which an unenlightened guest might treat as normal
system RAM (because it has to be accessible by the VMM, and that would
make it insecure if it's being used a general-purpose RAM).

So on x86 it might be an e820-reserved region for example.

I don't think we want the guest OS just *assuming* that there's usable
memory in that e820-reserved region, just because some device says that
it's actually capable of DMA to those addresses.

So it would probably want a separate object, like the separate
`restricted-dma-pool` in DT, which explicitly identifies that range as
a DMA bounce-buffer pool. We probably *can* do that even in ACPI with a
PRP0001 device today, using a `restricted-dma-pool` compatible
property.

Then the OS would need to spot this range in the config space, and say
"oh, I *do* have a swiotlb pool this device can reach", and use that.

Which is slightly less pretty than the DT model where the device's node
explicitly references the handle of the `restricted-dma-pool` node, but
I think that's OK. And it does kind of keep "device" capability
separate from "system" properties, in a comprehensible way.

> Maybe the new registers list the range of addresses device can access,
> and driver promises to be within that range by negotiating the
> feature bit?

That should work for the CoCo use case, yes.


--=-I5Ft7d1drvT8B/fLmD1B
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwNDExMTU1
MlowLwYJKoZIhvcNAQkEMSIEIDTgsSC59W8Ao3Z9O5y3sUIFmV2KICZcZJK5RnQYHsImMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAO4LuPoao+T1g
LZlaBCbbw7BHUduqAcp193rQ3NhqAuzDGx4RM8m0bKHwnhlXXZFIR49KsWn9jIMnMf2WmI739DXF
Urb9Ub95cviYOrfrLbuP2HbuD4JhW3K0aKVT7VjIDsZNNvq2EaA2kyCO5JNeBCTbpyfESe015yyB
D3bEpnLFz+7E+AFTFXCdsmlRuMRw3m6sI0OD2D7wlmBE4TUWTTu465oQSqKwKTg4RPPGEdeWmLaK
ZrR3ufQF7c4C06wBy6oj9395THdA/82zFUMCOwDBanpQ53Ky0zWdMm5MG0FAkOeuz8e4i4CCgpGn
3M5+vLdy2l0supjR+BdA0DcpCyM8Gsotx2JcEPUz6zWwJKz+tFwxm0axvKu9AJwftbCMlhgPxQHe
puJAHluRS8gvTl/SYG6CbAXbev+OGGu55/00vbpGMSIgLOoRpnB8x1ot69xD3ijoor46L1l3TjGd
6wQ1k5yNuxneZevn4QaTRwodTur+GEwxlS+ahrgTSnAR7hvK+07xn2SMNVZN5YI7ttc6ZZsryglW
AIa0ucyfT2S/LyYF6nfoRcjnzJ4fUKiY6ueQDJbGcqWvByeG99//x/HqJ2m/c+KwrRJ7tFoaup+k
lkS7sBkfhk3Mh7scM6dG/OrXyPmGvvMz67wOLd3R0ppgnXohW4tJ6uvjVqEkw+gAAAAAAAA=


--=-I5Ft7d1drvT8B/fLmD1B--
