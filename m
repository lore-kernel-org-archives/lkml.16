Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769381E32B9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743425447; cv=none; b=RSNDNUViVS8IwF3luNvpaT3mLt8WWpO6ti3uL+5Gk2Ha7xMGbNFYQBRDWsNhV0UhjhKVB8quz5rOGSUUC2zq47SR/V7sEfc/xByqxOBcT0rLZzCY/Dxqqit6HXxrItTWOrr/ywPoFjlDjETzZDQo0oyfv31G2ktggK6dOu9M0u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743425447; c=relaxed/simple;
	bh=7W6qQ9keK0BpPjvnmqw5CDVnwBmizcKCCBu2eHTneoo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VTbuOK7ioB8iclFQnDwsa92Qd/40DV0OkCOGO24XanJZRJoadpeZJhGCuGxtTPeitMQ9YPDDLYpOYuX+aexHJhE8+po+tYWURtPAOSgVX4rgXIJf+Q+6R9zhzYHN0Pikkw6Vy3MmSbbbVUhGZcJwZ7W8M3cDkh7BN9q7EFpZhCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KrkuiGg2; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KrkuiGg2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jJMjgcfJtQ3t79N9dIrfR4F9a0xZxCoodgcC2OCf4q0=; b=KrkuiGg2HbSLddEbtLbUmmAZKx
	Cpzcad/9Dy346GSDiDjlBLzi6nGTxUia3aTtPqHIMq5z+nYrHriiONRnH8/xFFdR8y+dGHnHwtrbd
	LRez6T4E5ORpnB2CMcc9mBcg72UxZjrbmHKLNUjBnIXbLLSyJckdxS9xSx08MpwaEw5MsSyMWG1sn
	BNoBanNXEKzdADA7vtjM9aevxxjJEUImRUx4anLBwk2zhwyXbmocIRI95VHRdomlTwLM3GpQEUcal
	AygbUK+pwG4h36mvSXLs7Jjfxfzi8wlgIkU+r+cEyMLY8ayGeRUszzkUe2Gz4eZCeLCdpQoQDEXf8
	2NDKoVlQ==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEb4-00000006djP-0IVq;
	Mon, 31 Mar 2025 12:50:34 +0000
Message-ID: <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
Subject: Re: [PATCH v4 2/4] memblock: update initialization of reserved pages
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>,  "Sauerwein, David" <dssauerw@amazon.de>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel
 <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, David
 Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Mike Rapoport <rppt@linux.ibm.com>, Will Deacon
 <will@kernel.org>, kvmarm@lists.cs.columbia.edu, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
Date: Mon, 31 Mar 2025 13:50:33 +0100
In-Reply-To: <20210511100550.28178-3-rppt@kernel.org>
References: <20210511100550.28178-1-rppt@kernel.org>
	 <20210511100550.28178-3-rppt@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-ZsEW6//1U010MxvHt2BM"
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html


--=-ZsEW6//1U010MxvHt2BM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-05-11 at 13:05 +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>=20
> The struct pages representing a reserved memory region are initialized
> using reserve_bootmem_range() function. This function is called for each
> reserved region just before the memory is freed from memblock to the budd=
y
> page allocator.
>=20
> The struct pages for MEMBLOCK_NOMAP regions are kept with the default
> values set by the memory map initialization which makes it necessary to
> have a special treatment for such pages in pfn_valid() and
> pfn_valid_within().
>=20
> Split out initialization of the reserved pages to a function with a
> meaningful name and treat the MEMBLOCK_NOMAP regions the same way as the
> reserved regions and mark struct pages for the NOMAP regions as
> PageReserved.
>=20
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> =C2=A0include/linux/memblock.h |=C2=A0 4 +++-
> =C2=A0mm/memblock.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 28 ++++++++++++++++++++++++++--
> =C2=A02 files changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 5984fff3f175..1b4c97c151ae 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -30,7 +30,9 @@ extern unsigned long long max_possible_pfn;
> =C2=A0 * @MEMBLOCK_NONE: no special request
> =C2=A0 * @MEMBLOCK_HOTPLUG: hotpluggable region
> =C2=A0 * @MEMBLOCK_MIRROR: mirrored region
> - * @MEMBLOCK_NOMAP: don't add to kernel direct mapping
> + * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
> + * reserved in the memory map; refer to memblock_mark_nomap() descriptio=
n
> + * for further details
> =C2=A0 */
> =C2=A0enum memblock_flags {
> =C2=A0	MEMBLOCK_NONE		=3D 0x0,	/* No special request */
> diff --git a/mm/memblock.c b/mm/memblock.c
> index afaefa8fc6ab..3abf2c3fea7f 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -906,6 +906,11 @@ int __init_memblock memblock_mark_mirror(phys_addr_t=
 base, phys_addr_t size)
> =C2=A0 * @base: the base phys addr of the region
> =C2=A0 * @size: the size of the region
> =C2=A0 *
> + * The memory regions marked with %MEMBLOCK_NOMAP will not be added to t=
he
> + * direct mapping of the physical memory. These regions will still be
> + * covered by the memory map. The struct page representing NOMAP memory
> + * frames in the memory map will be PageReserved()
> + *
> =C2=A0 * Return: 0 on success, -errno on failure.
> =C2=A0 */
> =C2=A0int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr=
_t size)
> @@ -2002,6 +2007,26 @@ static unsigned long __init __free_memory_core(phy=
s_addr_t start,
> =C2=A0	return end_pfn - start_pfn;
> =C2=A0}
> =C2=A0
> +static void __init memmap_init_reserved_pages(void)
> +{
> +	struct memblock_region *region;
> +	phys_addr_t start, end;
> +	u64 i;
> +
> +	/* initialize struct pages for the reserved regions */
> +	for_each_reserved_mem_range(i, &start, &end)
> +		reserve_bootmem_region(start, end);
> +
> +	/* and also treat struct pages for the NOMAP regions as PageReserved */
> +	for_each_mem_region(region) {
> +		if (memblock_is_nomap(region)) {
> +			start =3D region->base;
> +			end =3D start + region->size;
> +			reserve_bootmem_region(start, end);
> +		}
> +	}
> +}
> +

In some cases, that whole call to reserve_bootmem_region() may be a no-
op because pfn_valid() is not true for *any* address in that range.

But reserve_bootmem_region() spends a long time iterating of them all,
and eventually doing nothing:

void __meminit reserve_bootmem_region(phys_addr_t start,
                                      phys_addr_t end, int nid)
{
        unsigned long start_pfn =3D PFN_DOWN(start);
        unsigned long end_pfn =3D PFN_UP(end);

        for (; start_pfn < end_pfn; start_pfn++) {
                if (pfn_valid(start_pfn)) {
                        struct page *page =3D pfn_to_page(start_pfn);

                        init_reserved_page(start_pfn, nid);

                        /*
                         * no need for atomic set_bit because the struct
                         * page is not visible yet so nobody should
                         * access it yet.
                         */
                        __SetPageReserved(page);
                }
        }
}

On platforms with large NOMAP regions (e.g. which are actually reserved
for guest memory to keep it out of the Linux address map and allow for
kexec-based live update of the hypervisor), this pointless loop ends up
taking a significant amount of time which is visible as guest steal
time during the live update.

Can reserve_bootmem_region() skip the loop *completely* if no PFN in
the range from start to end is valid? Or tweak the loop itself to have
an 'else' case which skips to the next valid PFN? Something like

 for(...) {
    if (pfn_valid(start_pfn)) {
       ...
    } else {
       start_pfn =3D next_valid_pfn(start_pfn);
    }
 }



--=-ZsEW6//1U010MxvHt2BM
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDMzMTEyNTAz
M1owLwYJKoZIhvcNAQkEMSIEIJT10k3ewb1yCQUewPig0ByTa9B1kXbKTJjePv9J1DE9MGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAeNFTVPbjzwXB
484l62JvNyxIjd0pQqUZDCwPSxVvUkOpswvNMvNrgwMG2R2wX0eUY/BnZ/tCzeCzTmzStTK2n9Gk
XTWCaM98OK/B+O4MLhqxt7C6uMLV6q9rJ7sIivP3Hd9kVpfA7jQIkSZWiEuj9Fx4Zp6OpRuqVqpv
5/jZVeX5OY9/3ep7/tw69PEr7xqwFToAM2aHKv/c0hqpahoADrT6BU9XFA39qb4e3JABFYoOgPTX
v9eltaxrrGM4SIxQH469DeM75IWtg89i5qSraaqZAbqSxW1pTBMNXb2DXiKkTx+CAH9MdLZ2Tb6m
uzx4soPPaUOcosuQ/KDdv8184qP+Kf5mYeYg8sdmpT4vFKswgeH6OYrmGE13FE/cItH+9MtEjO7P
4T954ekHu4Sv0aksySzwGF/QP2/hrbPi3Zo1PsKkMGgSz1OmucQoTgvxHf5pscEJyPs38/hp68jt
xZowzy7ycZZPoMo3qbD52n4Jra2ypR6t9QB7u2YeovksxXa9hHOEk8W1XhGWbtUMBqNPJIdXLrEf
f2OJo5ISUgDo2pcX2VI2wfd9yVQ/pYeFQuUVzv5qQkmQ1440Yay16N886A0i3QND4fwq0mRIIHzl
HSBs4x8b0ui3v4O9/Jg/Yk/slcnGO1EWsaGNIocLs8BJQkYvq0eHdZnvjEtfeoAAAAAAAAA=


--=-ZsEW6//1U010MxvHt2BM--
