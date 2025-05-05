Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8323E58CD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746488045; cv=none; b=F31W6eJ8mS2gMnkhnQqIBDKPwUKQsqz0In/lW2xcRND2KQVMzFokscQWklYG3ZD28WrvkawCfb54sI8mtB4+//4ztAKJ/OEALJFjnZjvRb8hZtO0UgzC777l6t9kqIv3a1E6fEeTxKZIzwnjLPDSps/r6J0sAtmCjps+zkns6qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746488045; c=relaxed/simple;
	bh=sve3vY3CJA2H9KhL6N14xJagE0byGd/9BYCCTSFziCU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uJSLi2cWNwI+54U87cG1T/7jyGE1vXSB93rzFI1AM45qpZydqqCCa1GEfawooBXSGtdT/oqbC/MSL/v/XjBraNb4cfnuir5YExTapJZQDT2DELoCObo8RVL8740c0cAFLZseuGb3eVFx/5FHJAk5hoyVJSPqT923JMTfc/Aqvdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FSBQfC35; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FSBQfC35"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uiR+3CEeBKWRWtRm+179P73pOavCkS1oCUl8AfS/Uy8=; b=FSBQfC35lzQuk08eQZwxVcd1Fz
	jaT+Xw4o0DNf/FLkrmbiNM+IAtdZZQ0AeKURjSPGYJZcjMbZe+BY3CV4llkKc7uUU/ZC0aukncCXq
	hEap0BvotUz46fMgw6/NpMfB1ue1Zdyd6GD1lRi7Wk6NnxIIKqaNwdHNk7uGGfO5Ka6BG2ilIv6xb
	hENt1sb73US3e3dtiMvodMXwkwyXh+A3btgQOv+2oWlnj1B4RF30+jp90dnezZ1uivM37f0otSm1P
	Xf6kVzcJXKw19mYGsm0YOZ3iSRX9SVkulTVDT0fFReBlHDPzM5VEGgLmKRJDjNC+LZ0e16CX6qNNC
	OKCdK0DQ==;
Received: from [15.248.7.87] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC5Ij-0000000FZLN-0KnB;
	Mon, 05 May 2025 23:33:53 +0000
Message-ID: <944ddefdc0ef3dc0f78c7957afa7f12e360a4392.camel@infradead.org>
Subject: Re: [PATCH v1 0/6] x86/boot: Enable earlyprintk on MMIO (8-bit)
From: David Woodhouse <dwmw2@infradead.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ashish Kalra <ashish.kalra@amd.com>, "Kirill A. Shutemov"
 <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>,  Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Denis Mukhin
 <dmukhin@ford.com>
Date: Mon, 05 May 2025 16:32:38 -0700
In-Reply-To: <aBjSzIPaovOl03Eg@smile.fi.intel.com>
References: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
	 <db19e81405d17e9eb9a3c1d4798220178e4f9373.camel@infradead.org>
	 <aBjFtWDSuXVq9kW-@smile.fi.intel.com>
	 <3c1bd53c8ee5fe0a6e281551dfe2089679e8e5eb.camel@infradead.org>
	 <aBjSZA29o2zZYvGh@smile.fi.intel.com> <aBjSzIPaovOl03Eg@smile.fi.intel.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-1hyg0VtQQ3LT5b4SyEmR"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-1hyg0VtQQ3LT5b4SyEmR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-05-05 at 18:01 +0300, Andy Shevchenko wrote:
> On Mon, May 05, 2025 at 05:59:48PM +0300, Andy Shevchenko wrote:
> > On Mon, May 05, 2025 at 07:35:04AM -0700, David Woodhouse wrote:
> > > On Mon, 2025-05-05 at 17:05 +0300, Andy Shevchenko wrote:
> > > > On Fri, May 02, 2025 at 10:33:49AM -0700, David Woodhouse
> > > > wrote:
> > > > > On Fri, 2025-05-02 at 15:29 +0300, Andy Shevchenko wrote:
> > > > > > Some of the platforms may have no legacy COM ports and only
> > > > > > provide
> > > > > > an MMIO accessible UART. Add support for such to
> > > > > > earlyprintk for the
> > > > > > boot phase of the kernel.
> > > > >=20
> > > > > Shiny. I had to hack QEMU's PCI serial port to do unnatural
> > > > > things, in
> > > > > order to test the mmio32 variant which was the only thing the
> > > > > earlyprintk code used to support. But I *did* so, and it
> > > > > works with the
> > > > > kexec debugging.
> > > > >=20
> > > > > Can you add support for this mode to the kexec debugging too,
> > > > > please?
> > > >=20
> > > > Do you mean to add MMIO 8-bit to kexec assembly code and other
> > > > parts like you
> > > > did in the below mentioned change?
> > > >=20
> > > > I can try it at some point, but have no time right now for
> > > > this.
> > > > I would appreciate if you can give a try for this patch series
> > > > functionality to see if it helps for the initial messages (as
> > > > far as I understand you also want to have this in the second
> > > > kernel, right?).
> > >=20
> > > I'll see if I can find the time to take a look. Got a branch I
> > > can pull
> > > your series from?
> >=20
> > Yeo,
> > https://bitbucket.org/andy-shev/linux/commits/branch/topic%2Fx86%2Fboot=
-earlyprintk
> > .
>=20
> But just FYI that with `b4` it's as easy to pull from the mailing
> list as from
> a branch:
>=20
> 	b4 am
> 20250502123145.4066635-1-andriy.shevchenko@linux.intel.com
> 	git am -C1 -s ...


Thanks. Should I be expecting this to work...?

qemu-system-x86_64 -display none -vga none  -accel kvm,kernel-irqchip=3Dspl=
it \
  -kernel arch/x86/boot/bzImage \
  -append "console=3DttyS4 root=3D/dev/vda1 earlyprintk=3Dpciserial" \
  -chardev stdio,mux=3Don,id=3Dchar0,signal=3Doff -mon char0 -device pci-se=
rial,chardev=3Dchar0


I get no early output (I think it's still using the mmio32 variant),
and I only see output from when the real driver takes over:

[    0.894054] printk: legacy console [ttyS4] enabled
[    0.895498] printk: legacy bootconsole [earlyser0] disabled
...



--=-1hyg0VtQQ3LT5b4SyEmR
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDUwNTIzMzIz
OFowLwYJKoZIhvcNAQkEMSIEII7xIgdM8uhc7JOoRVPRG8tOPwKd7HV97ybJJwWaRF4dMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAttIwQ0UZwK6s
feQqJA+pIUblWC5xmKKX+wvcbdo6TckDUoE9B/bI13tpvnN93bD8AgaDRLNhcUpZvO9JxkqKu589
mfNqWEzXpTqwmmjZvqryIxSrsFgzmYaCXgQg6Z+A7Jx459Mv9Hgn8kSz3geP6akdHRok+ImqcYdi
+Y4OzC71Wd9lAFwSIYqdsuzIjK0ZPC7mjrnDCgGocNjZglB5RZnrGYGsx03XNG4SrwU7T7up7vbj
ubH+pfY8vpJhoI84GCFGeS5DnPMs31adqqVwsdtUe7mT2Kba4Nw3oaeEZqZiSgEG8XENR4JVqMYk
fVpSz8FWOqKHRygTkKgTzmfgyeOm+GOJAMxUh7XGH/WyUsMwMU8ZFpe88qWjFdsoHJnQJBSNCeQm
666WrnlqImaOINz0PAnxxepoWew9q5g/UoyCTL5ab9GSgxRPgj8DyUEy4SjMZAts5Lgj2EPz+tr4
G/3xoicXNaDJf6q4F2vyxhQtat8tpI4q5jOVP4zauX649xbCqborESugemqgUwtNXcqNWIAZRewB
E+gJMorL8XIf/pv1tvMnHVXOEQH0YSKX8d/HfRF2b7LNnwzx3cN28O++63d9hGjh7gYruw5rezHG
J+0c/k7762SKHdDcn0lo7FbxhJ8z9QRRq5RyOPUVNUePv9en8fimPWujmpNVBzsAAAAAAAA=


--=-1hyg0VtQQ3LT5b4SyEmR--
