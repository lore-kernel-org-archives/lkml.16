Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A0F19E7D1;
	Thu,  3 Apr 2025 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670681; cv=none; b=u8XFtfsyiMiZ4oTVrHY45q6aWdqTC3Uw6hXqzlDVQpYwCzi3fqW/lDjBc2oqA9I7f9WIjriGDz4maxJ/hs7pLqyJDx3EeblB1rQruBPOtCAKDC2iatm9KHlQEvjxn6Ras5lKB/C3uATWiUHJXvoHhVqPYZn1c1KAnNQqx4nBrvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670681; c=relaxed/simple;
	bh=7M7vDWKLX4YZ0KEasSf241fI/bxvNQ7WSDJ+RTbEi3g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u7BV255PFxQR6FO+6VhjZk+mjdl+UKBx5V+s3XYlTcmMbJntNEHyRLyLHYszHHdoYM+IKz43fTUqKTqkI7sxR5odo/ZFtzzIrAizCzCx1C+Iu/AnK1DpfJO1GNaQNTq0UotbTVMtrTRUJu++HUWwhQgQzh0XxSJVVkARMBE+pEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MywQEmur; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MywQEmur"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7M7vDWKLX4YZ0KEasSf241fI/bxvNQ7WSDJ+RTbEi3g=; b=MywQEmurh9B91rXIZZprE2kjYS
	dIusyUS+h+JR2dMkIrdduMFuNnfPUrMWYlAzZNLzTw3t1YkJtiwAiktGLfMwTqNJyYrQQ/ZVuwTyj
	5fSWw2jKJ3G8i5wPsotQHrdtbCLlioAhdKlj94hxVgfd77QSjqQ4eUKIHQzTOZi78n7sZyYAfnMAk
	j+eYLff3Qw6hPAmPXNsL9iyD48SOk5FsOhtvqaAQKPIXFQ6R9/d6su2Kg9Vuykp+E3PZokT7NXWcu
	8hAMfhsFBCTDr39w+GhCJJj1rfGxgP0Zk0CJ/9bgGIWXmqo/1vTaLQ2R/OouIPHuozeDOlLy72SgA
	uKMvjz3g==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GOa-000000079qp-0AfK;
	Thu, 03 Apr 2025 08:57:56 +0000
Message-ID: <fe9b1c4603f95d31933d22305a55b9f682ba76ec.camel@infradead.org>
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use
 of SWIOTLB bounce buffers
From: David Woodhouse <dwmw2@infradead.org>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org, Claire Chang
 <tientzu@chromium.org>, linux-devicetree <devicetree@vger.kernel.org>, Rob
 Herring <robh+dt@kernel.org>, =?ISO-8859-1?Q?J=F6rg?= Roedel
 <joro@8bytes.org>,  iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
Date: Thu, 03 Apr 2025 09:57:55 +0100
In-Reply-To: <c7c5e449-3df1-4162-b5ef-c9e05945d22b@amd.com>
References: <20250402112410.2086892-1-dwmw2@infradead.org>
	 <20250402112410.2086892-2-dwmw2@infradead.org>
	 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
	 <20250403033230-mutt-send-email-mst@kernel.org>
	 <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>
	 <20250403040643-mutt-send-email-mst@kernel.org>
	 <0261dfd09a5c548c1a0f56c89c7302e9701b630d.camel@infradead.org>
	 <c7c5e449-3df1-4162-b5ef-c9e05945d22b@amd.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-9GU+cV9gg/kx1fk2r01Y"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-9GU+cV9gg/kx1fk2r01Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-04-03 at 16:34 +0800, Zhu Lingshan wrote:
> On 4/3/2025 4:22 PM, David Woodhouse wrote:
> > On Thu, 2025-04-03 at 04:13 -0400, Michael S. Tsirkin wrote:
> > > On Thu, Apr 03, 2025 at 08:54:45AM +0100, David Woodhouse wrote:
> > > > On Thu, 2025-04-03 at 03:34 -0400, Michael S. Tsirkin wrote:
> > > > > Indeed I personally do not exactly get why implement a virtual sy=
stem
> > > > > without an IOMMU when virtio-iommu is available.
> > > > >=20
> > > > > I have a feeling it's about lack of windows drivers for virtio-io=
mmu
> > > > > at this point.
> > > > And a pKVM (etc.) implementation of virtio-iommu which would allow =
the
> > > > *trusted* part of the hypervisor to know which guest memory should =
be
> > > > shared with the VMM implementing the virtio device models?
> > > Is there a blocker here?
> > Only the amount of complexity in what should be a minimal Trusted
> > Compute Base. (And ideally subject to formal methods of proving its
> > correctness too.)
> >=20
> > And frankly, if we were going to accept a virtio-iommu in the TCB why
> > not just implement enough virtqueue knowledge to build something where
> > the trusted part just snoops on the *actual* e.g. virtio-net device to
> > know which buffers the VMM was *invited* to access, and facilitate
> > that?
> you trust CPU=C2=A0 and its IOMMU, and the virtio-iommu is provided by th=
e hypervisor,
> emulated by the CPU. If you don't trust virtio-iommu, then you should not=
 trust
> the bounce buffer, because it is unencrypted, more like a security leak.
>=20
> Actually everything is suspicious even the CPU, but you have to trust a T=
CB and
> try to minimize the TCB. I remember there is an attestation mechanism to =
help
> examine the infrastructure.=C2=A0 We need a balance and a tradeoff.

In the pKVM model, we have a minimal trusted part of the hypervisor,
which some are calling a "lowvisor", which enforces the property that
even the rest of Linux/KVM and the VMM are not able to access arbitrary
guest memory.

For true PCI passthrough devices, hardware has a two-stage IOMMU which
allows the guest to control which parts of its memory are accessible by
the devices.

The problem is those device models which are emulated in the VMM,
because the VMM no longer has blanket access to the guest's memory.

The simplest answer is just for the device models presented by the VMM
to *not* do DMA access to guest system memory. Stick a bounce-buffer on
the device itself, and do I/O through that.

Yes, as you say, we have to trust the CPU and its IOMMU. And the
microcode and low-level firmware, etc.

But we do *not* trust most of Linux/KVM and the VMM. We only trust up
to the pKVM "lowvisor" level. So if there is going to be a virtio-
iommu, that's where it would have to be implemented. Otherwise, the VMM
is just saying to the lowvisor, "please grant me access to <this> guest
page because...erm... I said so". Which is not quite how the trust
model is supposed to work.

As noted in the original cover letter to this series, there are other
options too. We could implement enlightenments in the guest to
share/unshare pages, and corresponding dma_ops which simply invoke
those hypercalls. That's a bit less complexity in the TCB, but does end
up with a set of guest enlightenments which need to be supported in the
core of every operating system.

Compared with the option of a simple device driver for a device which
conceptually doesn't do DMA at all.



--=-9GU+cV9gg/kx1fk2r01Y
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwMzA4NTc1
NVowLwYJKoZIhvcNAQkEMSIEIPMpnwaIxMZp6fxJkeUuWWLTHvftJ7QUvS4FynDAdtPAMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAYSaMHsyht4df
qs8drQFU6Vk5J4keb7+clQdiuuNNJ6Hms1ZudNzkkIcWEXElJqfxiGfblEoliWx6j5TjQStoOmx2
SPCjQ8vjEPkzmCti5vjGXf2EqBznqG8mSBWlSdnnPGkoCiuKjISbNC1btsv5IY8cc6/jp3ZQndDY
DX71Zk+dj3JZzXNalmOCdlMus8qE+5YIiZdQWO+X6zZKtRfLQ9GSmWetLjpwLhcwQ83zO2GOCHOV
vo629cjr/3P+j4omgIq+abkquIH6cfsA5BYSEyaCJ0TwCW3tPgrclSxJE934nopR9N2pxaX78mTC
3R7OACvbabSdMbVlKyzIntdjX0IJ9HcHaHNGuef4TazgcqHq9q0BOoMUvaWZ1xPUYDszaX0+NxS0
M+EMThOelnW9B3USAk1HO1BnSQyhqQOZX+uZMHX855o0M7ml4pBpxkMvW505T5+CPPiH2eOH0mOE
8+tzlTAsiMw7j+wUuFBfVfhBZ2M9V+LMb4o5AtzHcVmwmBV8mbab21YzD0+PTm+MCYmFi4aJNisZ
8JrUF8+KC5Vrros36iLGXL9kUbIDxZJQm6bl7PXOEcwayVjPv/JAjM+IwqSTSMkv1GG3xid7xhxV
prHP5Xx+gLpM3n2iXhlLrt4R/25/0j6+yoK/UbK1I4hRZ2PdRdEzrym/rWLzADIAAAAAAAA=


--=-9GU+cV9gg/kx1fk2r01Y--
