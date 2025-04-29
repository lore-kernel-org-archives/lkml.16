Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8DB1DD0C7;
	Tue, 29 Apr 2025 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935956; cv=none; b=ZVmsgZsxqyk9AHT0vup+hGViG1SNOBf4Jo+qYDwskPAvbWhVw8ayNXtEaCtiVRkWldg6p4H8O9nnxL3anv4lL0kPOBguLaMKLG/Dad2alt0FQeXKmWdLMwIWx1DdIS1bGR1ZQXRt09jVHkCmkfmPvSV7R6/zn8GLp2rJP1VlnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935956; c=relaxed/simple;
	bh=68cW4ZforvOQzheTtZyyFvpW8rkRGsrOL6sivyfyl9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frpteEkDhFSi5UJqlrJFn4pN7iNf9zWAE2ap4u38BtNaK3aGoANeBerfEGT8qDQLHiJJfvzXRpfq8k9HZGmmUwXCS3f0nphGQ9D5Oyt72ICEHOBK7wmdawB/pEIWXU/vuvscJBnfQukm/bTurgIX43qLtnySYWomrbvU740hjTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7tCl8ad; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7tCl8ad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF984C4CEED;
	Tue, 29 Apr 2025 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745935955;
	bh=68cW4ZforvOQzheTtZyyFvpW8rkRGsrOL6sivyfyl9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p7tCl8ad5Adz/XjilPNVRg7bc6iNBo6R6g7SeqHC0fXmnjGeYJTYQ4pSpzTGaJi8H
	 WU8GHdO9vzXyu+jhUCotgSMwJ7MMMlBCZ8Rpm+CWQwtpyUMx97ll7KYjfxu1NsoO6d
	 VLEO7hg5WudPMap+8QsPlm3FCiOsUfL2/I8mfi/0udGksCMCTt4yTyBcrP98rKe/MY
	 u6gb6kxz5oBIOyMKCkt+qLYlxjc1rlfSiTQ+2Y+oRMhQL5K3WPqM+KR8f8H3DSDr3r
	 WibX7oqwpnEjhvSLcXEy0yzuoqMMvTCkbmg/srskbOnwnGi/Q3IY5qASVS/ZLFRVVA
	 4dEawA1DlLYAg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so10565914a12.3;
        Tue, 29 Apr 2025 07:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdHNgoDJgEB0m9CRbku8ZNuCjONz7Ws/NT9OZ6Gs+kQzW0PmAWCxqKaSZp/Jra41ffJq2GZKyxCBqz5Ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdOyWRAHomqMM6m2sf97cFb0+MAEPCgxmR80QXFDxNcZumI71I
	pUewTJyvPJCuwqlN52FlqA4VtIe+f4g0rL2YHAbo1H6oWdQf846zNeBZfGMS6+z8iTqb8JpK/hs
	IT7AEABmi8UQK2NPcELNmw2PQig==
X-Google-Smtp-Source: AGHT+IHF9LLsBRnDGdFGg7NcSnHBwKMcpEBwvXfP2vD3nYugY4TaStR4VLwZ3jkNT7pJPSzFOgkU3/lfDYyB91jKoEw=
X-Received: by 2002:a05:6402:2707:b0:5f6:23b1:ab43 with SMTP id
 4fb4d7f45d1cf-5f83801e6b5mr3752497a12.0.1745935953526; Tue, 29 Apr 2025
 07:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422084340.457-1-alireza.sanaee@huawei.com> <20250422084340.457-2-alireza.sanaee@huawei.com>
In-Reply-To: <20250422084340.457-2-alireza.sanaee@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Apr 2025 09:12:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+c9ipDNYB8PTc38xThgsMkjk9bp896_=y7a5r3v_muvg@mail.gmail.com>
X-Gm-Features: ATxdqUGLpxoyUPcs3uqq8T1sfWTnELobJTZA-LgabgMRIzuY3jqy3EEPe1QkbjM
Message-ID: <CAL_Jsq+c9ipDNYB8PTc38xThgsMkjk9bp896_=y7a5r3v_muvg@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] DT: add infra for finding CPU id from phandle.
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree-spec@vger.kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com, 
	linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 3:44=E2=80=AFAM Alireza Sanaee
<alireza.sanaee@huawei.com> wrote:
>
> Get CPU id from phandle. Many drivers get do this by getting hold of CPU
> node first through a phandle and then find the CPU ID using the relevant
> function. This commit encapsulates cpu node finding and making driver
> code easier to cleaner.

easier to cleaner?

In the subject, use the prefix of the sub-system (of), and drop the period.

>
> The API interface requires three parameters, 1) node, 2) pointer to CPU
> node, and 3) property which includes the phandle. API sets the pointer
> to the CPU node and allows the driver to play with the CPU itself, for
> logging purposes for instance.
> ---
>  drivers/of/cpu.c   | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h |  3 +++
>  2 files changed, 43 insertions(+)
>
> diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
> index 5214dc3d05ae..c2d729999a4e 100644
> --- a/drivers/of/cpu.c
> +++ b/drivers/of/cpu.c
> @@ -173,6 +173,46 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
>  }
>  EXPORT_SYMBOL(of_cpu_node_to_id);
>
> +/**
> + * of_cpu_phandle_to_id: Get the logical CPU number for a given device_n=
ode
> + *
> + * @node: Pointer to the device_node containing CPU phandle.
> + * @cpu_np: Pointer to the device_node for CPU.
> + * @prop: String of property holding the phandle.
> + *
> + * Return: The logical CPU number of the given CPU device_node or -ENODE=
V if
> + * the CPU is not found. If the property is not found, it returns -1. On
> + * success, cpu_np will always point to the retrieved CPU device_node.
> + */
> +int of_cpu_phandle_to_id(const struct device_node *node,
> +                        const struct device_node *cpu_np,

This needs to 'struct device_node **cpu_np' to actually work.

> +                        const char * prop)

I think prop here is always 'cpus' or 'cpu', so we can just try both
rather than passing it in. A node is not going to have both. With
'cpus', you need to provide the index.

> +{
> +       bool found =3D false;
> +       int cpu, ret;
> +       struct device_node *np;
> +       struct of_phandle_args args;
> +
> +       if (!node || !prop)
> +               return -1;
> +
> +       ret =3D of_parse_phandle_with_args(node, prop, NULL, 0, &args);
> +       if (ret < 0)
> +               return ret;
> +
> +       cpu_np =3D args.np;
> +       for_each_possible_cpu(cpu) {
> +               np =3D of_cpu_device_node_get(cpu);
> +               found =3D (cpu_np =3D=3D np);
> +               of_node_put(np);
> +               if (found)
> +                       return cpu;
> +       }

This loop is just of_cpu_node_to_id(), use it here.


> +
> +       return -ENODEV;
> +}
> +EXPORT_SYMBOL(of_cpu_phandle_to_id);
> +
>  /**
>   * of_get_cpu_state_node - Get CPU's idle state node at the given index
>   *
> diff --git a/include/linux/of.h b/include/linux/of.h
> index eaf0e2a2b75c..5e51e57478b1 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -360,6 +360,9 @@ extern const void *of_get_property(const struct devic=
e_node *node,
>  extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread=
);
>  extern struct device_node *of_cpu_device_node_get(int cpu);
>  extern int of_cpu_node_to_id(struct device_node *np);
> +extern int of_cpu_phandle_to_id(const struct device_node *np,
> +                               const struct device_node *cpu_np,
> +                               const char *propname);

You need an empty static inline version.

>  extern struct device_node *of_get_next_cpu_node(struct device_node *prev=
);
>  extern struct device_node *of_get_cpu_state_node(const struct device_nod=
e *cpu_node,
>                                                  int index);
> --
> 2.43.0
>
