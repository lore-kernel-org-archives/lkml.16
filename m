Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F66124BCED;
	Mon, 10 Feb 2025 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203451; cv=none; b=ZAhUgA0Iykwzk85/noug94Im+6YMQpmUPWbVrDQrJIS0DIEmpVgfBKUgTUWXk4BCascRzg7jNpMT08MiCOIRO1APfolnT2KPKY30oJI6txYf9J0KVJ9tFwoQqDRV4nRLeQQ4zu2G0AJlsAUA1Br1ltavvEcx37ll/SmqvOYCeTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203451; c=relaxed/simple;
	bh=MmLzTVOIrpo7J0HmbhxBdjKvlFVJINa0c786cp4K2is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afs83McR9DtLcH2r/Uy0mqSGNVankAuPKWxoIdfoS10DOPwulrL18CN4xsY7xycaUnjgKjxYokO9SJ6fD7QtX19GY2fsrJN8y07vydXWCKb8DTiq2appz8LlgVSh1DFrLbEVboxiuV7N2vZESa4QDdz+h7SIz2krBVBLR0vI5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMZF+ghu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMZF+ghu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDA8C4CEE8;
	Mon, 10 Feb 2025 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739203451;
	bh=MmLzTVOIrpo7J0HmbhxBdjKvlFVJINa0c786cp4K2is=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IMZF+ghuSiCCJz57Q5USpgV4CW3vxkE+nfMG1knu6gzbU8ZVVARB0CrktiwrIk67E
	 Hp+1zFYkDBupPWkLP2fek6SjxBtdd8uZX3bsyrNGaGd3VDsFNAQzMV0B8Bw7PLqno7
	 J8yGHYrFy3lE1q9NnvTqoTJ6L6/fNTihHlNov7BXlXsi3mInlQtMMtxsIsIU8E/YP2
	 6fuhEdcGiIM2KpifkoHYPYf7AyXzUlFejV237V6OD7muNrezl//ORBJCZM9V0Z2cGP
	 fe78vxqe0+Y6PyqE84mgPUSfNDFYrpSDzRGZFIFOrU6co1irCDDPsKdgFbxPQ6BLzB
	 vldIL+nl53Ugw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5de861dcb04so1260045a12.1;
        Mon, 10 Feb 2025 08:04:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSrwid6885/fwO0fPPtRZZ4NBRB3IxrrxYCXtlEsZl/O/2LriK1sXHq+ktDMZ14++W4HhfTXNhncUy@vger.kernel.org, AJvYcCXnZysc0zmCT+vUCYO7VVCB7PyNLq5S720GRgNFUpxTbmsaRfvOrjDfQV8xsf5yT6TxCKc2gXt5LDAO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7AvPTYZLPahaSvvU4OXaheTxEUfKKSfDEKlmbCy9MtQ5/q/QW
	9aZ4KrW4VURdZ0PqN5VpXtvmj+WiCPMX0wqTEu+QixkW8k1rf7iYmhqL4bJESxtMMmyHFk5iEbj
	ZMo2oJ4leDlaCwbz5vQGTauaPyA==
X-Google-Smtp-Source: AGHT+IFRZNJEmIDWeGq7jBDTWhH6Y05jOZW3+7OggCVpp9D3eKLI+N0SQhYn4TTzkQ07b3SjWfpk0D6PnrkmWhtaNlQ=
X-Received: by 2002:a05:6402:4308:b0:5de:5cea:869e with SMTP id
 4fb4d7f45d1cf-5de5cea8b38mr8326232a12.32.1739203449824; Mon, 10 Feb 2025
 08:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <20250206132754.2596694-14-rppt@kernel.org>
In-Reply-To: <20250206132754.2596694-14-rppt@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Feb 2025 10:03:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLBf1Vv6K5mK6x9JRqegvScSNFpAEE2iJOkJ4JuBTLsCw@mail.gmail.com>
X-Gm-Features: AWEUYZkqxkn1PB0pgkw5chjo9LRqD9SA0TtsGYB7u__vI-ErDb4_rUvPql-Dcx4
Message-ID: <CAL_JsqLBf1Vv6K5mK6x9JRqegvScSNFpAEE2iJOkJ4JuBTLsCw@mail.gmail.com>
Subject: Re: [PATCH v4 13/14] memblock: Add KHO support for reserve_mem
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:30=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
>
> From: Alexander Graf <graf@amazon.com>
>
> Linux has recently gained support for "reserve_mem": A mechanism to
> allocate a region of memory early enough in boot that we can cross our
> fingers and hope it stays at the same location during most boots, so we
> can store for example ftrace buffers into it.
>
> Thanks to KASLR, we can never be really sure that "reserve_mem"
> allocations are static across kexec. Let's teach it KHO awareness so
> that it serializes its reservations on kexec exit and deserializes them
> again on boot, preserving the exact same mapping across kexec.
>
> This is an example user for KHO in the KHO patch set to ensure we have
> at least one (not very controversial) user in the tree before extending
> KHO's use to more subsystems.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/memblock.c | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 131 insertions(+)
>
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 84df96efca62..fdb08b60efc1 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -16,6 +16,9 @@
>  #include <linux/kmemleak.h>
>  #include <linux/seq_file.h>
>  #include <linux/memblock.h>
> +#include <linux/kexec_handover.h>
> +#include <linux/kexec.h>
> +#include <linux/libfdt.h>
>
>  #include <asm/sections.h>
>  #include <linux/io.h>
> @@ -2423,6 +2426,70 @@ int reserve_mem_find_by_name(const char *name, phy=
s_addr_t *start, phys_addr_t *
>  }
>  EXPORT_SYMBOL_GPL(reserve_mem_find_by_name);
>
> +static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t =
size,
> +                                         phys_addr_t align)
> +{
> +       const void *fdt =3D kho_get_fdt();
> +       const char *path =3D "/reserve_mem";
> +       int node, child, err;
> +
> +       if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
> +               return false;
> +
> +       if (!fdt)
> +               return false;
> +
> +       node =3D fdt_path_offset(fdt, "/reserve_mem");
> +       if (node < 0)
> +               return false;
> +
> +       err =3D fdt_node_check_compatible(fdt, node, "reserve_mem-v1");
> +       if (err) {
> +               pr_warn("Node '%s' has unknown compatible", path);
> +               return false;
> +       }
> +
> +       fdt_for_each_subnode(child, fdt, node) {
> +               const struct kho_mem *mem;
> +               const char *child_name;
> +               int len;
> +
> +               /* Search for old kernel's reserved_mem with the same nam=
e */
> +               child_name =3D fdt_get_name(fdt, child, NULL);
> +               if (strcmp(name, child_name))
> +                       continue;
> +
> +               err =3D fdt_node_check_compatible(fdt, child, "reserve_me=
m_map-v1");

It really seems you all are trying to have things both ways. It's not
Devicetree, just the FDT file format, but then here you use
"compatible" which *is* Devicetree. At best, it's all just confusing
for folks. At worst, you're just picking and choosing what you want to
use.

I'm not saying don't use "compatible" just for the sake of looking
less like DT, but perhaps your versioning should be done differently.
You are reading the 'mem' property straight into a struct. Maybe the
struct should have a version. Or the size of the struct is the version
much like the userspace ABI is handled for structs.

> +               if (err) {
> +                       pr_warn("Node '%s/%s' has unknown compatible", pa=
th, name);
> +                       continue;
> +               }
> +
> +               mem =3D fdt_getprop(fdt, child, "mem", &len);
> +               if (!mem || len !=3D sizeof(*mem))
> +                       continue;
> +
> +               if (mem->addr & (align - 1)) {

It's stated somewhere in this that the FDT data is LE, but here you
are assuming the FDT is the same endianness as the CPU not that it's
LE. Arm64 can do BE. PowerPC does both. I'm not sure if kexec from one
endianness to another is possible. I would guess in theory it is and
in practice it's broken already (because kexec is always an
afterthought). Either you need to guarantee that native endianness
will never be an issue for any arch or you need to make the endianness
fixed.

Rob
