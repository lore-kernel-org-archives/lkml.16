Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7162FE085
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746501562; cv=none; b=JV/xRa6UHUo2N2DqjShtqWY52QYyYpXfWzFjYuQBupUQhbgiiwG8Aft6O9G55is51OYfvHGozuC+aKbhA2sCcSjv1sfJFDGwiChjKoZvrtTFYVKVBhBroVFQxXixbB/IPVrYzJ3lPSinuyudJxit+iTCuweUgnsUM5nIeTex4RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746501562; c=relaxed/simple;
	bh=SxeEi1tAOcX2d70LYt+z+Ni8g/gFI9Pu/YnGg+QnZrw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XggsQBbBhRkI2IqGD433BZQG2Vve0UYBJl2AWLRHpNQrxoT6K8C2wYaIjHX1uBIRCsE8HwvmKh5yJkI98ef6sZ4L1QL08MjNBr5aUMRGe9oWmW+lXcimUoLRE3/6UEhuqnQnxzqTDz9xn8031/nWuvxvxXxQKniMyJ/LpYXSMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PmCqRO+t; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PmCqRO+t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZeZmCG8Rp23jEiEukTixuUunYCEKGdOE3CORiFF/t1s=; b=PmCqRO+tDPtGvCgrJ2l9DRop3S
	3I3TQCs/Txy5Qy+LwusjMfmh3mJCBGerUbhu/bLy61JI9AiSMTHv4svO+UDwo7x4VfOLdUUKIH3eG
	yP2K2zQu71ABCbLY/V74qz5mqkA6fMcELJEpIXM0T3cf+ddHHqoLnCaV8tx1XI2+HTnblBJadiYtX
	WRjm+D/Fcv8RY1gS8AT4MojtHqQ6RQkjX5vMtLYnYn0QbfF8Mc4VBT2oarzfs5FMko/KggIFzeF7O
	9fleafT3/DqrW3zhpD1LUVJdmi8d6W2aupJw7JSuC29mAiQrGAMvsirv+623/ulSDNow75xL7MQO7
	vfwZShjw==;
Received: from [65.133.87.50] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC8pu-0000000FalN-0pHA;
	Tue, 06 May 2025 03:19:15 +0000
Message-ID: <0f861de2000013ba89f2adc2f1237e1b4abe248b.camel@infradead.org>
Subject: Re: [PATCH v1 0/6] x86/boot: Enable earlyprintk on MMIO (8-bit)
From: David Woodhouse <dwmw2@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Denis Mukhin
 <dmukhin@ford.com>
Date: Mon, 05 May 2025 20:19:09 -0700
In-Reply-To: <944ddefdc0ef3dc0f78c7957afa7f12e360a4392.camel@infradead.org>
References: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
	 <db19e81405d17e9eb9a3c1d4798220178e4f9373.camel@infradead.org>
	 <aBjFtWDSuXVq9kW-@smile.fi.intel.com>
	 <3c1bd53c8ee5fe0a6e281551dfe2089679e8e5eb.camel@infradead.org>
	 <aBjSZA29o2zZYvGh@smile.fi.intel.com> <aBjSzIPaovOl03Eg@smile.fi.intel.com>
	 <944ddefdc0ef3dc0f78c7957afa7f12e360a4392.camel@infradead.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-7P6HBZxPS6y0BS5l3bkj"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-7P6HBZxPS6y0BS5l3bkj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-05-05 at 16:32 -0700, David Woodhouse wrote:
>=20
> Thanks. Should I be expecting this to work...?
>=20
> qemu-system-x86_64 -display none -vga none=C2=A0 -accel kvm,kernel-irqchi=
p=3Dsplit \
> =C2=A0 -kernel arch/x86/boot/bzImage \
> =C2=A0 -append "console=3DttyS4 root=3D/dev/vda1 earlyprintk=3Dpciserial"=
 \
> =C2=A0 -chardev stdio,mux=3Don,id=3Dchar0,signal=3Doff -mon char0 -device=
 pci-serial,chardev=3Dchar0

Hm, no, qemu's pci-serial is PIO. I'd need to do this:

--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -58,7 +58,7 @@ static void serial_pci_realize(PCIDevice *dev, Error **er=
rp)
     s->irq =3D pci_allocate_irq(&pci->dev);
=20
     memory_region_init_io(&s->io, OBJECT(pci), &serial_io_ops, s, "serial"=
, 8);
-    pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io);
+    pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->io);
 }
=20
 static void serial_pci_exit(PCIDevice *dev)


And then the kernel's 'earlyprintk=3Dpciserial' needs to be told the BDF,
e.g. earlyprintk=3Dpciserial,00:03.0,keep

And it's still defaulting to mmio32 unless I do this in the kernel...

--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -198,7 +198,7 @@ static __init void early_serial_init(char *s)
=20
 static __noendbr void mem32_serial_out(unsigned long addr, int offset, int=
 value)
 {
-       u32 __iomem *vaddr =3D (u32 __iomem *)addr;
+       u8 __iomem *vaddr =3D (u8 __iomem *)addr;
        /* shift implied by pointer type */
        writel(value, vaddr + offset);
 }
@@ -206,7 +206,7 @@ ANNOTATE_NOENDBR_SYM(mem32_serial_out);
=20
 static __noendbr unsigned int mem32_serial_in(unsigned long addr, int offs=
et)
 {
-       u32 __iomem *vaddr =3D (u32 __iomem *)addr;
+       u8 __iomem *vaddr =3D (u8 __iomem *)addr;
        /* shift implied by pointer type */
        return readl(vaddr + offset);
 }


If you can get this part working sanely, I'll happily add the kexec debug p=
art.


--=-7P6HBZxPS6y0BS5l3bkj
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDUwNjAzMTkw
OVowLwYJKoZIhvcNAQkEMSIEIF+Sox5VuiKk1oKtma1WAZFtaVNtmhV5zaBYX5obUaMWMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIADfVqX0q7a+M6
Y+BBSlOiq27jRWqevYIRwd7XP3Vv+Wj8EUFLoUGK55XEzVlM0zFto2jTyNEmI/G0fjrsg3L2Gi3y
9mGBD8cmPt+zXt0D/0Q0j5q1+bH9gCz391bOgP1cLG2JA5P1SAapyiCDbusB/kkfcscuiG7Bf0uW
fEzXuJ2yYYkswh8zLNyDvsIuFrQq1I1Tasz22xXWr74mqc1vvy6VQltY91flGddapfbx8dIVT+4L
6IjcV570c8TDi/pCLPY2C2WSV0nRTQzbugyWqvwnvXnuLwkeGGhNQJnaHHR+x518lpqMPUGLmTkg
BZBcetIRGL6HjAdIMXYDtkNsnhiiMclItGzuxib3y4P3in8rUBeGBT0kEz1m/PE2ThroAIPaRf4a
v1fd7CdI+rEWIN4DH8CfjX9B1qWXDPSSK24DuJF7b3yq9Qg05rc/R7/ARkuP1/Vrubj2s+I9p7Rz
vaNgdPv1Le2bC/ZmR6Qt9KJ/5ekQNPcUhsmcCh3ZS97A6Ffo14cHyHfpUvhFzyTzmuqHegNG+dGd
sjSe2Xo6OsvXzBZTuDYTq3WW0jnV0ZzjQ/ifudEHca2qtxw0Pk2GLeVy/cZ5IVkcdeasNZW85VEy
IX5qLVRRmDRsQyXLblROpQXHC+xYYiyDtaDSMHPhirMOA/U45u3bTnC/H2ewd5YAAAAAAAA=


--=-7P6HBZxPS6y0BS5l3bkj--
