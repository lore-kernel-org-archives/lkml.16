Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCB419ADA2
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749407908; cv=none; b=QCqHNRcvYm6XiSHdYDvauBCHwMtxoxCpLAicrsQvWvg5nWOoFOJ4wmjhotUqXwBFuRG5I46oXWV2VEVBDt5YbSCVvKQE0I7CR6DmQ3uOOzuYQwxxOX/RdI6xQsBBhJ9zsB4KeStt0pjLNH8S3etdyWzbBDeKZGmAKebxqVbbZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749407908; c=relaxed/simple;
	bh=MhexPRy7Y/Sga0gVrG7wgU2UMqkaTI5g0Pdll0WUkCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNCx/laFhbsGgZo72D393zL4sKQkUvDbubgJr6knk3z6B3WAPfpdcIcNLJSzA5SNrH19qkUD+xc1L3SYjX0qJm/n28YA1cHuOLKLnODQZhT5LODp9Ki9YaYgVM4dp9Ygcm9W1OGatpYrDMqn1wWVoTwX8DXku739uUI6+klNDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lc3qDiYg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lc3qDiYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749407904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fVPNaS5VAE3yHHygUG3///XjchuLxOQpALrW75eFOBs=;
	b=Lc3qDiYgaCFjmAzlEdr3N8dW51ybP1yZWsLVqqacVE/R633FZG0WEvZwt2QGmGO3/JVDZg
	YOuyMrpAIeDg04FBZcAr78GnglZDnEPw3bc9yEqHbM46btl6GcX5YeDix0pi5GWgw3Iunu
	LugvTUV1+up4DVgnfzQyIDasBY6KOvs=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-tQunkWVcPmuyH7coUi0sDA-1; Sun, 08 Jun 2025 14:38:23 -0400
X-MC-Unique: tQunkWVcPmuyH7coUi0sDA-1
X-Mimecast-MFC-AGG-ID: tQunkWVcPmuyH7coUi0sDA_1749407903
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e649662deso48075157b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 11:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749407903; x=1750012703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fVPNaS5VAE3yHHygUG3///XjchuLxOQpALrW75eFOBs=;
        b=OXgF20kbCkVIt2vdSGcu1cngDN8IOArQpBjwt0TikLG1WgPu2IPjdLROlFXgagCEmn
         mL8r12RpQLcTFPCgvOvLTJFrkLxeGfXlwGPR+tdA1iZbDPgkj7rj9ya38WXTi/W7oebY
         17ofiYJ3r5kdOJ1mGur3c2tVzC4ZihJkjhR7jCaz4Z69oJYIw49bRgVavA1rYdBuQgKN
         48HkLZcRn4BydWMSzM+WL23UuNdfWX6vMN5IYZA/CpLd5nV0fQN/uOIuFH8rAhWhxLcB
         umoPrsl2BhG3Kl/+yG/0xkX4LTB3orH9n8ASNQ/D2QoICI1POkrCOn+WUGLc2CdiqB6X
         WMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt2ms8i/6ju1YYkFALsJ0SF5XFPqjo0r76USEJoPlTbAcUuWBHE2XUqD7SYnMx2VmIkbt77qeBPW/ceL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Uvv5b6P6FuTG32HMMC9MUZ6BimnJ7Xp8Hou+/VbgGJV8VqLO
	G2pmHOPk0JHW5OSPKFELOcMaNRW1BrqSBUEzNBRq0PjMiRnhC5JJhqa9jU1gXQcOsFJARXnrqlE
	kOiM/ijk6nGjqkpOBy2G8dimSJZ9b1z9xH7ITGni3BkA5m0/NOu3gg2I0JFCDHaMaaR6hkNXcwW
	Qz6qYjyA0nlRm3eYHuZnnclSL291AP1KORQGH0ZqTH
X-Gm-Gg: ASbGncsDWFdC3xP4dQxsDDLahDEhQn6cYyMUEZIcme/LSmCjtaaT9vdfPItpQrEkKVL
	QhFnCraOzRkIQnd6oNPj+5iQSVKmqUjzFaItugBmXOBy5+jN7OTGmyNhKoBPcvfuF4tHpVPuOTa
	9go0CY5g==
X-Received: by 2002:a05:690c:998b:b0:70e:73ae:768d with SMTP id 00721157ae682-710f7660c60mr148819677b3.14.1749407902997;
        Sun, 08 Jun 2025 11:38:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuPHc429bq/hnlIxPnHLdZTlslObu46Hc4lr1iA3871tAbvtL0uPRHVn18HINC8NF2H7zrGgqHTnzzVwG11Eg=
X-Received: by 2002:a05:690c:998b:b0:70e:73ae:768d with SMTP id
 00721157ae682-710f7660c60mr148819577b3.14.1749407902703; Sun, 08 Jun 2025
 11:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com> <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Sun, 8 Jun 2025 12:37:56 -0600
X-Gm-Features: AX0GCFt_EXk5S4LHCfsWbdtypeT52mnYwXqLeNHKIB74ww6gs_33cqhx0LGPq1A
Message-ID: <CAA1CXcDgm4EK5sAs6eFa0RiJHaO=H4vCLMKfjZe_GCXvP+c=xw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 2:01=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> The MADV_COLLAPSE will ignore the system-wide Anon THP sysfs settings, wh=
ich
> means that even though we have disabled the Anon THP configuration, MADV_=
COLLAPSE
> will still attempt to collapse into a Anon THP. This violates the rule we=
 have
> agreed upon: never means never.
>
> Another rule for madvise, referring to David's suggestion: =E2=80=9Callow=
ing for collapsing
> in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> To address this issue, should check whether the Anon THP configuration is=
 disabled
> in thp_vma_allowable_orders(), even when the TVA_ENFORCE_SYSFS flag is se=
t.
>
> In summary, the current strategy is:
>
> 1. If always & orders =3D=3D 0, and madvise & orders =3D=3D 0, and hugepa=
ge_global_enabled() =3D=3D false
> (global THP settings are not enabled), it means mTHP of that orders are p=
rohibited
> from being used, then madvise_collapse() is forbidden for that orders.
>
> 2. If always & orders =3D=3D 0, and madvise & orders =3D=3D 0, and hugepa=
ge_global_enabled() =3D=3D true
> (global THP settings are enabled), and inherit & orders =3D=3D 0, it mean=
s mTHP of that
> orders are still prohibited from being used, thus madvise_collapse() is n=
ot allowed
> for that orders.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  include/linux/huge_mm.h | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2f190c90192d..199ddc9f04a1 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -287,20 +287,35 @@ unsigned long thp_vma_allowable_orders(struct vm_ar=
ea_struct *vma,
>                                        unsigned long orders)
>  {
>         /* Optimization to check if required orders are enabled early. */
> -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> -               unsigned long mask =3D READ_ONCE(huge_anon_orders_always)=
;
> +       if (vma_is_anonymous(vma)) {
> +               unsigned long always =3D READ_ONCE(huge_anon_orders_alway=
s);
> +               unsigned long madvise =3D READ_ONCE(huge_anon_orders_madv=
ise);
> +               unsigned long inherit =3D READ_ONCE(huge_anon_orders_inhe=
rit);
> +               unsigned long mask =3D always | madvise;
> +
> +               /*
> +                * If the system-wide THP/mTHP sysfs settings are disable=
d,
> +                * then we should never allow hugepages.
> +                */
> +               if (!(mask & orders) && !(hugepage_global_enabled() && (i=
nherit & orders)))
> +                       return 0;
Hi Baolin,

Thanks for making this change so we enforce the 'never' being never
rule. As others have noted, this statement is hard to read-- is there
any improvements we can make to the readability as Lorenzo suggested?

Either way, I've tested this and the functionality works as intended.

Tested-by: Nico Pache <npache@redhat.com>


-- Nico
> +
> +               if (!(tva_flags & TVA_ENFORCE_SYSFS))
> +                       goto skip;
>
> +               mask =3D always;
>                 if (vm_flags & VM_HUGEPAGE)
> -                       mask |=3D READ_ONCE(huge_anon_orders_madvise);
> +                       mask |=3D madvise;
>                 if (hugepage_global_always() ||
>                     ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled(=
)))
> -                       mask |=3D READ_ONCE(huge_anon_orders_inherit);
> +                       mask |=3D inherit;
>
>                 orders &=3D mask;
>                 if (!orders)
>                         return 0;
>         }
>
> +skip:
>         return __thp_vma_allowable_orders(vma, vm_flags, tva_flags, order=
s);
>  }
>
> --
> 2.43.5
>

