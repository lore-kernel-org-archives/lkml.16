Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB96226170;
	Mon,  7 Apr 2025 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029984; cv=none; b=QLA5G2yYd6tyKyBtV3kouHUua5+IxfQWP6S/7oaT8kJxuXaD0GWaRAu0I32erIreNJdMThsMpwvYD64H1LwFMWUB18Gv09aZJB1U/zIp5jDnZYbtoEyb9UeolpXL30lT0cFnJpiicbxQgtHNy7SVhlz4F+ehbd8HQYF3xITrfLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029984; c=relaxed/simple;
	bh=awrNsZWV5nSX7p7ue6vo+aZV8nLHTp/fCQJTnQ2xznE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bcwpiFHoyzR1g90HaXHnrpeXLe+durqt1dWYifenBQk9eiqrseYXbzEz0AGuykKs0KE18Hxh6F4W5/DXXSFV2Rtd2l07mPSVp1RQPEA8br1JOtXlnQ5z0/1na63BXkkXyunJBDfYjeF4onSAAQnc59Dst6rqkKCxZtCuKD5ndOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ITll9t9T; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ITll9t9T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=awrNsZWV5nSX7p7ue6vo+aZV8nLHTp/fCQJTnQ2xznE=; b=ITll9t9TxcrxD0Cqp1O68TplCj
	VFGMn5jVkNVqvsdmmHe/MSMt0Lq1R0loIOJa7snvWlowxybUnshwYw1gAOaqpJZ98rvM/8aJpss3Q
	SM4qcjg5yrpUi5ii//v9EgzmFHgSXhuBdYTDrCfenraSjThnuaLVvP+jC8/H7VZn+9rm63XFtGxuH
	Kf98X9F717CjoUAKqmwJ1DruC9QmmVWGZ1NuwmqNIgZWSf7ZQnB85JYBY5zDoEdKQHfC4O5LReIbh
	kZcvoNCrHrovVO0OiJSi7Dep09xT1Kiu0E2q9Q/ykmIj5gBQdEdPu6T3Uzeol9V4YFe1nh9dXZUJu
	T76dTd2Q==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lrl-00000007wyi-0CT5;
	Mon, 07 Apr 2025 12:46:17 +0000
Message-ID: <8f85d15478a578f7d9ab63b7e5edecda94830a84.camel@infradead.org>
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
Date: Mon, 07 Apr 2025 13:46:16 +0100
In-Reply-To: <20250407081110-mutt-send-email-mst@kernel.org>
References: <05abb68286dd4bc17b243130d7982a334503095b.camel@infradead.org>
	 <Z-99snVF5ESyJDDs@infradead.org>
	 <fb7ea3ee5bf970fa36b012e16750f533b72903a0.camel@infradead.org>
	 <20250404040838-mutt-send-email-mst@kernel.org>
	 <67bd998bfe385088ef863342b9f8714754585476.camel@infradead.org>
	 <20250404043016-mutt-send-email-mst@kernel.org>
	 <F30D33D5-38CC-4397-8DC8-9EE1B0FEF40D@infradead.org>
	 <5cc2f558b0f4d387349c3a2936ff00430804536d.camel@infradead.org>
	 <20250404062409-mutt-send-email-mst@kernel.org>
	 <7fd789b61a586417add2115f6752ebec5e7b81bf.camel@infradead.org>
	 <20250407081110-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-CvO4McfBwZWmhMi4ADxu"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-CvO4McfBwZWmhMi4ADxu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-04-07 at 08:14 -0400, Michael S. Tsirkin wrote:
> On Fri, Apr 04, 2025 at 12:15:52PM +0100, David Woodhouse wrote:
> > > What I don't get, is what does the *device* want, exactly?
> >=20
> > The device wants to know that a driver won't try to use it without
> > understanding the restriction. Because otherwise the driver will just
> > give it system addresses for DMA and be sad, without any coherent
> > error/failure report about why.
> >=20
> > (You could ask the same question about what the *device* wants with
> > VIRTIO_F_ACCESS_PLATFORM, and the answer is much the same).
> >=20
> > Or maybe not the *device* per se, but the *system integrator* wants to
> > know that only operating systems which understand the restriction
> > described above, will attempt to drive the device in question.
> >=20
> > We could achieve that by presenting the device with a completely new
> > PCI device/vendor ID so that old drivers don't match, or in the DT
> > model you could make a new "compatible" string for it. I chose to use a
> > VIRTIO_F_ bit for it instead, which seemed natural and allows the
> > device model (under the influence of the system integrator) to *choose*
> > whether a failure to negotiate such bit is fatal or not.
>=20
> Let's focus on the mmio part, for simplicity.
> So IIUC there's a devicetree attribute restricted dma, that
> guests currently simply ignore.

No, I think Linux guests with CONFIG_DMA_RESTRICTED_POOL enabled will
honour it just fine and do the right thing. For virtio-mmio.

> You want to fix it in the guest, but you also want to find a clean way
> to detect that it's fixed. Right?

For virtio-mmio I believe there's no bug to fix.

Sure, it would have been nice if a feature bit had been added when this
attribute was defined, so that a device which *knows* it has this
restriction could gracefully decline to operate with a driver which
doesn't understand it.

But as you pointed out, that ship has sailed. Enforcing a new feature
bit now for virtio-mmio devices would break compatibility even with
existing drivers in kernels which *do* have CONFIG_DMA_RESTRICTED_POOL
enabled and which do work today.

There's nothing to fix here for virtio-mmio.

> And if so, my question is, why this specific bug especially?
> There likely are a ton of bugs, some more catastrophic than just
> crashing the guest, like data corruption.
> Is it because we were supposed to add it to the virtio spec but
> did not?

If I could easily expose virtio-mmio on an ACPI-afflicted guest instead
of using virtio-pci, maybe that might suffice=C2=B9.

But while we might be able to hack that up for Linux guests, I don't
think that's feasible for the general case. So what I'm trying to do
here is just bring the same capability to virtio-pci, that already
exists for virtio-mmio.

And if we do so I *would* like to get it right this time and add that
feature bit.




=C2=B9 It'd want MSI support, and the CONFIG_DMA_RESTRICTED_POOL support in
the kernel is a bit OF-specific and probably needs to be made a bit
more generic in some places. But I'm prepared to consider those as
implementation details, and the latter probably needs to be done anyway
for any of the approaches we've considered for supporting this in
virtio-pci.

--=-CvO4McfBwZWmhMi4ADxu
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwNzEyNDYx
NlowLwYJKoZIhvcNAQkEMSIEIJ6IEqHhkM5rvYz/uum1QYqq0maKbj6eyg95ssXaSL5AMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAKNrqPG2SqoF6
L1DW6BVHfwqTKrrfN1l8bLe6J2nmPHyFH4Xkmbmn4MRJM6YJAYDvjJaYOshtMwApqEtv9HapXDKC
H22arlIC08ruBap5hNP7+vxDIW4lUzzvjeTFW/lkP3ZU6ZiDI0vawLA++V6rZKqlBK1ZgqA/8Jsg
PnNmgZxgy9TIK9WZLWf3wdR63ZNU0sjKCE5MiIgeNEnTRC7sNwqNzLuTC0P6WLD7f9bI92yJ1y3I
0clkVrbzFlQeBWfvpxYbCwcoQ/v/zotF4KkombQtK6k2cZEEnlr+Zeqxo/xcys3GmWIrLEctNPTb
Cyz+f3G0kVX60Mq/276UpzeQppqnfi7FxXKpn4Z9TEM5fISA/wN+8jnvRD57RodvUduN0KfM9o2D
RKB9PqnKrAF9RPYl44OVoHpjJ7BL1OFsFhSZJH91MDxt+Cnic+kHRZZfgXD2p1oQ3TJnUOST2hVC
JgTSL1VIyee27Jyvv2F1OBXhJHWsOodyr6eL88VKVhFVKTYcYJ1jf6bcCl9R7Uxia5JhI+c/9WDv
NaGgUdVDXh3uHLJOy/Ayp0hzHnKaTJSGKCSrV2wabJbKSihIHDOk+K5NMmX3k5Mz4UCn2WOi9JDj
7GLuFgAhrXVaPqdAQUwPLo31ECuWLjQHQDpL2Er7Wfgriuj8/WJMMTyv3sc5XTAAAAAAAAA=


--=-CvO4McfBwZWmhMi4ADxu--
