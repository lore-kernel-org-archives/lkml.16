Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA411E511;
	Wed,  2 Apr 2025 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608846; cv=none; b=oAENwFEEqMLmZFJlG0aKNq8bkXu+/GQZRTeI/+TlS6YfL4+XK6MY91cyifMyMUaI+vzkwAgNYoz8KO0+p/HcJOli/oj1MNd19fC6KNG56k760/3w2hysBrZyOk2gkFLz3+Bq7Mh2R+LJGAXOQbgK44ER9w4vSVmwib84ftBHeA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608846; c=relaxed/simple;
	bh=ianagpQrzxuiEeJ8qW2ygl6eJKVkOCgieWnMU/rRnEQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ia2I7kPQzcTqquKVF7VII+QuDQ6KbtpMC/1W8Qq2nJOm67tioHbwakVL8bwZIe8GX2rTuEbl8hERGd2xv8qQ5M8T9v6lo7vFkFp7/LX8y+Y+Ffr0docIOvlKTkS9pPIQEjlfFgeDM8jhYNR4r+5Y0Cq+GA7/d0JM2uCyc0ncLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bVeSAzRj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bVeSAzRj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ianagpQrzxuiEeJ8qW2ygl6eJKVkOCgieWnMU/rRnEQ=; b=bVeSAzRj0JOrev4EhTfFjc6TTp
	AARQ5+7ADehtDROhy/uOTlzl2uIHPsvcAfezfo7iyeW5bsyMvXq2G4IKBVIm72Y7hmd/o/Z1JU6jV
	Y4xhIooYaq3f7YWsis8vpP8D8BsiLB8KlY1wQcSagVTsxUs60OOYSgEjLa9FfQyEWz9nqn3Q1dwbC
	BdSTIzQ2LVtLnt7L0xGVSrUN+SosDKOc/G+tkxzJ/tyjWFYBFj27KMQar6m0y3812Ra+b6FVce7+7
	3iwgJpjtoflzGedwO+gIJd6rQh4bKwvK/7BZLlZToMh1wKXY1j+/pP6tPRss89//Eh1w7QfmvWirh
	ppXFu/tA==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00JC-000000073sF-2Y13;
	Wed, 02 Apr 2025 15:47:18 +0000
Message-ID: <6b3b047f1650d91abe5e523dd7f862c6f7ee6611.camel@infradead.org>
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org, Claire Chang
 <tientzu@chromium.org>, linux-devicetree <devicetree@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, =?ISO-8859-1?Q?J=F6rg?= Roedel
 <joro@8bytes.org>,  iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
Date: Wed, 02 Apr 2025 16:47:18 +0100
In-Reply-To: <20250402111901-mutt-send-email-mst@kernel.org>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
	 <20250402112410.2086892-2-dwmw2@infradead.org>
	 <20250402105137-mutt-send-email-mst@kernel.org>
	 <19ba662feeb93157bc8a03fb0b11cb5f2eca5e40.camel@infradead.org>
	 <20250402111901-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-6RjDHDqdoAIfGBoxa/uv"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-6RjDHDqdoAIfGBoxa/uv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2025-04-02 at 11:20 -0400, Michael S. Tsirkin wrote:
> On Wed, Apr 02, 2025 at 04:12:39PM +0100, David Woodhouse wrote:
> > On Wed, 2025-04-02 at 10:54 -0400, Michael S. Tsirkin wrote:
> > > > +=C2=A0 If a the device transport provides a software IOTLB bounce =
buffer,
> > > > +=C2=A0 addresses within its range are not subject to the requireme=
nts of
> > > > +=C2=A0 VIRTIO_F_ACCESS_PLATFORM as they are considered to be ``on-=
device''.
> > >=20
> > > I don't get this part. the system designers currently have a choice
> > > whether to have these controlled by VIRTIO_F_ACCESS_PLATFORM or not.
> > > with PCI, for example, BAR on the same device is naturally not
> > > behind an iommu.
> >=20
> > In the PCI case this *is* a BAR on the same device, and is naturally
> > not behind an IOMMU as you say. This is just stating the obvious, for
> > clarity.
>=20
> Then the platform already does this right, and it's better not to
> try and override it in the spec.

It isn't intended as an "override". This *is* what will happen if the
platform does it right. By mandating it in the spec, the intent is to
reduce the chances of platforms doing it *wrong*? (Or of drivers making
wrong assumptions).

> > For virtio-mmio it also isn't translated by an IOMMU; that was the
> > *point* of the `restricted-dma-pool` support.
> >=20
>=20
> Clear VIRTIO_F_ACCESS_PLATFORM then?

> I don't want to say that VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_SWIOTLB

> are mutually exclusive...


> Generally, it is preferable to keep all features orthogonal if
> at all possible.

...precisely because they *should* be orthogonal.

VIRTIO_F_ACCESS_PLATFORM defines how system memory is accessed;
basically whether DMA goes through an IOMMU or not. And as you point
out, the "on-device" buffer used with VIRTIO_F_SWIOTLB=C2=A0should never
pass through the IOMMU anyway, so it *is* naturally orthogonal.


And I think it does make sense for both to be set in some cases, for
both physical and virtual devices.


For physical devices that would mean "Got an IOMMU? Sure, go ahead and
use it. If not, if you don't trust me, you can just disable my bus
mastering and just use the SWIOTLB".

It's basically the same for a virtual device. In a confidential compute
model, the device model (in the VMM) might not be *able* to access the
guest memory unless the core guest OS explicitly permits that, through
some kind of pKVM enlightenment to allow pages to be shared, or a
vIOMMU, or marking hardware pages unencrypted. So having both bits set
would mean "Know how to drive that enlightenment? Sure, go ahead and
use it. Otherwise, use the SWIOTLB".

In fact that's exactly what that Linux code for `restricted-dma-pool`
already does =E2=80=94 when setting up the dma_ops for the device, if it fi=
nds
an actual set of IOMMU operations, it'll use those. And if not, that's
when it falls back to using the provided SWIOTLB.


--=-6RjDHDqdoAIfGBoxa/uv
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwMjE1NDcx
OFowLwYJKoZIhvcNAQkEMSIEIJ3mutCpC8d5SW0U9yi1LopnyHSecQuTYG6TRpTZow7QMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAQUb+dOI3LH7A
hFt0Kat4NH1EOd0Jlq1Nh7GDhTmjv5bKyJcEJ3L8gLJvOlFHl4NoKqzDq6pPiTZlotcI6PLExZ2D
MjV6PuiBpF3Sa3qnO8KTzvCMfP/3CYlvwT0X1GN4zp4ahdux+AFmV+/s+JftbBuklp2EW08UqVb4
NJ4DKQG59bmweAH5TZa0GGDZ9fVEm3B+KpuYngZbEq67CedUnpa545vPmLt/5kai4p5ukydYNIdQ
S214qcJELFOpPzmwwnWFGN2bQkNYd2zAYLScJTXnePUOH8zQITiu6CM2SzGj6wiWuzogBVWTVEFF
+nrFHnkKI8Vz/fRPp3CcOvsXHftkUR8V0SRksbV1AM7qsVkkRDo5ib/lNIGAl1FMBgYD7UzaWpO1
0XwR2r7rsPy+v+agcrDMtPyfcv85Usqw54jdOiges4dpp0JLcrzQjGb8ywZ9/UTwZ9ec+jBsL64R
1SXZ/mvgUaJp3qigi0tlKwu+jsGX3xkrYaeUqnpC+Odcm0VI0lf9zwnnp2i48OOyK9LRn1LJCULZ
DcyuhqY3cSwX/N2b1Wuxmm1fRHXvr5A+ibUtcfR9XKQd1w0v/efwM1NKqqk/yhtswa/J3giATFLu
6NMdbszNezSgFiJt5Q8ecJRUKn26QKWBFbiLcP9XznG8BQ6okRoDFt0D3VpdgZgAAAAAAAA=


--=-6RjDHDqdoAIfGBoxa/uv--
