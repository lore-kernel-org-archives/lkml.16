Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3C2F37
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748394; cv=none; b=IumabyHD9Csu3NzYNN4LxjvgSSjNAm9+eDtbc9OolIYWy/Z0vHmhmOnpEcXbuMZmz2z5uHiGu3KJqnEy5h+AlGIa4S/A8f7VoquMmxnQiOxAcg1m/inLc0QWC/XyLFcY0Feh5/cfSLHADkI6nUS6ODQi79d96m3gmmDMpeYRRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748394; c=relaxed/simple;
	bh=1iRcJwWAfFpPUoQqIflZ2HudlOnmmrJs4o0O3dmUXkk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YP6AEq8iVGQtrvClNQZaXrMX+V513HNXmq0mA4gQrrbuB2nruOiKjucNMNAslDHA1v2iz5THLzr4x9U9lZcR6v9Yhmd5+6smfi86Zihd+AyXAxL/PC8ju/c1RNAN84jUpL5KzXsUtYVn9Zm7PPTeK53a3MzH1LaaBKBZJDisAHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VdxkrFeL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VdxkrFeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747748391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4y6ogTj1oVC2owmi8NZRMSK17ALEGUDrSSspJ9SQWjg=;
	b=VdxkrFeLhN2icgP6LOnGTM4RTgxglmrbawivB6CJCvcZkDozAHTUMji0fnnFhIAbARzG/r
	by8hCEvlziByF1UpJxDZYm4F6Nn8THNCilzp4mYI8biac8R45p/sUQ/JoHIa6r3daAY3z6
	JWpGnKmaQJjzCrndFFz2XskN6VHBLB0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-w86lbIRgPFSlo8K-smOwkg-1; Tue, 20 May 2025 09:39:49 -0400
X-MC-Unique: w86lbIRgPFSlo8K-smOwkg-1
X-Mimecast-MFC-AGG-ID: w86lbIRgPFSlo8K-smOwkg_1747748388
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a3696a0ce6so1238913f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748388; x=1748353188;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4y6ogTj1oVC2owmi8NZRMSK17ALEGUDrSSspJ9SQWjg=;
        b=P27DZMvfz/MXGavr7T6rnGYDOrrspzkoPw1RRCq6faFqs3TSp78yfv17Mic7ygE2Qi
         VLtxhnuq/1CZ1FIyBW9SFuWnKKGZ1Nh/JDhjSmxHVflky333CL/29odPW3RFBcj7hV5b
         m78MXrk6ZfuSHUiBeTMRsLxD0jP4YWoJdogWmLSs5WZ3smb26KT5jPFpND9k7HS6GYqV
         d9BzIKxjgHtRZcb/X73VzPgcVCaJMYIkSde64SmlXlMRWrPOwzQuHekEsB8E3l24E+4B
         crVISYUzqVF5Xy/ijx/a2pfWMKSeL31yPJBey0y4wQIWueL8b+NKgTL68J7gmJfGT3WP
         Yxdw==
X-Gm-Message-State: AOJu0YwzxNMFqGCFlAIO8l4ufBzIQ2sHmV5KHOjA/WliksDBGOn70W8N
	FrmTRJ+FJeTPbaSFRwz3fYB8BKN2wPKC8Q4O0dY3jPNYGo7CUSjCT0f30NtoLvlLMqurGZX8p7B
	8ZhBjrQLtU97t6dmJ7nb7M1J2+zZoYD9aqYCxQlbnGOkVF2Bm2Y5dIhB/N0vtVMNd8Q==
X-Gm-Gg: ASbGnct/8SuLOddRtIUPk7rb41aZNHRC8VQjjoLASs8mLzYekMA0kL7HpJyS58s8GXV
	grV5LoeSj8tqyiUvC4V/NknE74IdHremGNgTZrZsWYjcjJTUSL1AauCotGfEp9jnNMQByb7PK2U
	4WlxjTeOQXDFrLl3HynQGjPehpUS5NufaE5s4UExgjov4neqQhfYMT7iZDROvX1IZN8u8gkCwV7
	dtzp/ndYS1V196yBhC60NqWV1EseN96vcg2tfs+cBOF4itOh559FIYvN4vAcA82chd9bjH5mO+Y
	YA9/cYjHArxVijkjHfzXafYwbCz0GCO6UqcdQA==
X-Received: by 2002:a5d:64e8:0:b0:3a3:76f5:3b0d with SMTP id ffacd0b85a97d-3a376f53b87mr4605113f8f.57.1747748388418;
        Tue, 20 May 2025 06:39:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiUiAS8D4gjNDyD1o4n2YlEkmljK0ljJJnyxXBXYghEiyCa69YESuX4lig0cihpuHpPI/OMw==
X-Received: by 2002:a5d:64e8:0:b0:3a3:76f5:3b0d with SMTP id ffacd0b85a97d-3a376f53b87mr4605086f8f.57.1747748387908;
        Tue, 20 May 2025 06:39:47 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88978sm16776382f8f.65.2025.05.20.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:39:47 -0700 (PDT)
Message-ID: <df3ea0c02afb98a8dfc06f29d5ff56bbe8588dd8.camel@redhat.com>
Subject: Re: [PATCH v5 5/6] cgroup/cpuset: Fail if isolated and nohz_full
 don't leave any housekeeping
From: Gabriele Monaco <gmonaco@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>,
  Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 20 May 2025 15:39:45 +0200
In-Reply-To: <20250508145319.97794-13-gmonaco@redhat.com>
References: <20250508145319.97794-8-gmonaco@redhat.com>
		 <20250508145319.97794-13-gmonaco@redhat.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-05-08 at 16:53 +0200, Gabriele Monaco wrote:
> Currently the user can set up isolated cpus via cpuset and nohz_full
> in
> such a way that leaves no housekeeping CPU (i.e. no CPU that is
> neither
> domain isolated nor nohz full). This can be a problem for other
> subsystems (e.g. the timer wheel imgration).
>=20
> Prevent this configuration by blocking any assignation that would
> cause
> the union of domain isolated cpus and nohz_full to covers all CPUs.
>=20
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---

Waiman, while testing this patch I got a few doubts how errors should
be reported in cpusets and the general behaviour when cpuset is
combined with boot-time isolation.

This is the behaviour introduced by the current patch:
* Assume we boot a 16 cores machine with nohz_full=3D8-15
* We configure an isolated cgroup with 0-9 exclusive CPUs
* the partition file complains with:
  isolated invalid (partition config conflicts with housekeeping setup)
  nproc: 16 (ok)
* we now set the same cgroup with 0-6 isolated CPUs
  the partition is marked as isolated (expected)
  nproc: 9 (ok)
* we set back the CPUs as 0-9
  I'd expect an error somewhere but partition is still isolated
  nproc: 9 (ok?)

Checking with nproc shows 7-9 are not isolated (but this is not visible
in the effective exclusive CPUs which shows still 0-9).

Now this behaviour seems incorrect to me, but is consistent with the
other flavour of PERR_HKEEPING (already upstream):
* set isolcpus=3D8-15
  nproc: 8
* set 5-9 as isolated
  isolated invalid (as above)
  nproc: 8
* set 5-7
  isolated
  nproc: 13 (?!)
* set back 5-9
  still isolated
  nproc: 16 (?!)

Here nproc reports isolcpus as no longer isolated, which I find even
more confusing.

Now my questions: is it alright not to report errors when we fail to
isolate some CPUs but can allocate them as exclusive in the cpuset?
Can cpuset really undo some effects of isolcpus or is that a glitch?

Thanks,
Gabriele

> =C2=A0kernel/cgroup/cpuset.c | 67
> ++++++++++++++++++++++++++++++++++++++++--
> =C2=A01 file changed, 65 insertions(+), 2 deletions(-)
>=20
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 95316d39c282..2f1df6f5b988 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -80,6 +80,12 @@ static cpumask_var_t subpartitions_cpus;
> =C2=A0 */
> =C2=A0static cpumask_var_t isolated_cpus;
> =C2=A0
> +/*
> + * Housekeeping CPUs for both HK_TYPE_DOMAIN and
> HK_TYPE_KERNEL_NOISE
> + */
> +static cpumask_var_t full_hk_cpus;
> +static bool have_boot_nohz_full;
> +
> =C2=A0/*
> =C2=A0 * Housekeeping (HK_TYPE_DOMAIN) CPUs at boot
> =C2=A0 */
> @@ -1253,10 +1259,26 @@ static void reset_partition_data(struct
> cpuset *cs)
> =C2=A0static void isolated_cpus_update(int old_prs, int new_prs, struct
> cpumask *xcpus)
> =C2=A0{
> =C2=A0 WARN_ON_ONCE(old_prs =3D=3D new_prs);
> - if (new_prs =3D=3D PRS_ISOLATED)
> + if (new_prs =3D=3D PRS_ISOLATED) {
> =C2=A0 cpumask_or(isolated_cpus, isolated_cpus, xcpus);
> - else
> + cpumask_andnot(full_hk_cpus, full_hk_cpus, xcpus);
> + } else {
> =C2=A0 cpumask_andnot(isolated_cpus, isolated_cpus, xcpus);
> + cpumask_or(full_hk_cpus, full_hk_cpus, xcpus);
> + }
> +}
> +
> +/*
> + * isolated_cpus_should_update - Returns if the isolated_cpus mask
> needs update
> + * @prs: new or old partition_root_state
> + * @parent: parent cpuset
> + * Return: true if isolated_cpus needs modification, false otherwise
> + */
> +static bool isolated_cpus_should_update(int prs, struct cpuset
> *parent)
> +{
> + if (!parent)
> + parent =3D &top_cpuset;
> + return prs !=3D parent->partition_root_state;
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -1323,6 +1345,25 @@ static bool partition_xcpus_del(int old_prs,
> struct cpuset *parent,
> =C2=A0 return isolcpus_updated;
> =C2=A0}
> =C2=A0
> +/*
> + * isolcpus_nohz_conflict - check for isolated & nohz_full conflicts
> + * @new_cpus: cpu mask
> + * Return: true if there is conflict, false otherwise
> + *
> + * If nohz_full is enabled and we have isolated CPUs, their
> combination must
> + * still leave housekeeping CPUs.
> + */
> +static bool isolcpus_nohz_conflict(struct cpumask *new_cpus)
> +{
> + if (!have_boot_nohz_full)
> + return false;
> +
> + if (!cpumask_weight_andnot(full_hk_cpus, new_cpus))
> + return true;
> +
> + return false;
> +}
> +
> =C2=A0static void update_exclusion_cpumasks(bool isolcpus_updated)
> =C2=A0{
> =C2=A0 int ret;
> @@ -1448,6 +1489,9 @@ static int remote_partition_enable(struct
> cpuset *cs, int new_prs,
> =C2=A0 =C2=A0=C2=A0=C2=A0 cpumask_intersects(tmp->new_cpus, subpartitions=
_cpus) ||
> =C2=A0 =C2=A0=C2=A0=C2=A0 cpumask_subset(top_cpuset.effective_cpus, tmp->=
new_cpus))
> =C2=A0 return PERR_INVCPUS;
> + if (isolated_cpus_should_update(new_prs, NULL) &&
> + =C2=A0=C2=A0=C2=A0 isolcpus_nohz_conflict(tmp->new_cpus))
> + return PERR_HKEEPING;
> =C2=A0
> =C2=A0 spin_lock_irq(&callback_lock);
> =C2=A0 isolcpus_updated =3D partition_xcpus_add(new_prs, NULL, tmp-
> >new_cpus);
> @@ -1546,6 +1590,9 @@ static void remote_cpus_update(struct cpuset
> *cs, struct cpumask *xcpus,
> =C2=A0 else if (cpumask_intersects(tmp->addmask, subpartitions_cpus) ||
> =C2=A0 cpumask_subset(top_cpuset.effective_cpus, tmp->addmask))
> =C2=A0 cs->prs_err =3D PERR_NOCPUS;
> + else if (isolated_cpus_should_update(prs, NULL) &&
> + isolcpus_nohz_conflict(tmp->addmask))
> + cs->prs_err =3D PERR_HKEEPING;
> =C2=A0 if (cs->prs_err)
> =C2=A0 goto invalidate;
> =C2=A0 }
> @@ -1877,6 +1924,12 @@ static int
> update_parent_effective_cpumask(struct cpuset *cs, int cmd,
> =C2=A0 return err;
> =C2=A0 }
> =C2=A0
> + if (deleting && isolated_cpus_should_update(new_prs, parent) &&
> + =C2=A0=C2=A0=C2=A0 isolcpus_nohz_conflict(tmp->delmask)) {
> + cs->prs_err =3D PERR_HKEEPING;
> + return PERR_HKEEPING;
> + }
> +
> =C2=A0 /*
> =C2=A0 * Change the parent's effective_cpus & effective_xcpus (top cpuset
> =C2=A0 * only).
> @@ -2897,6 +2950,8 @@ static int update_prstate(struct cpuset *cs,
> int new_prs)
> =C2=A0 * Need to update isolated_cpus.
> =C2=A0 */
> =C2=A0 isolcpus_updated =3D true;
> + if (isolcpus_nohz_conflict(cs->effective_xcpus))
> + err =3D PERR_HKEEPING;
> =C2=A0 } else {
> =C2=A0 /*
> =C2=A0 * Switching back to member is always allowed even if it
> @@ -3715,6 +3770,7 @@ int __init cpuset_init(void)
> =C2=A0 BUG_ON(!alloc_cpumask_var(&top_cpuset.exclusive_cpus, GFP_KERNEL))=
;
> =C2=A0 BUG_ON(!zalloc_cpumask_var(&subpartitions_cpus, GFP_KERNEL));
> =C2=A0 BUG_ON(!zalloc_cpumask_var(&isolated_cpus, GFP_KERNEL));
> + BUG_ON(!alloc_cpumask_var(&full_hk_cpus, GFP_KERNEL));
> =C2=A0
> =C2=A0 cpumask_setall(top_cpuset.cpus_allowed);
> =C2=A0 nodes_setall(top_cpuset.mems_allowed);
> @@ -3722,17 +3778,24 @@ int __init cpuset_init(void)
> =C2=A0 cpumask_setall(top_cpuset.effective_xcpus);
> =C2=A0 cpumask_setall(top_cpuset.exclusive_cpus);
> =C2=A0 nodes_setall(top_cpuset.effective_mems);
> + cpumask_copy(full_hk_cpus, cpu_present_mask);
> =C2=A0
> =C2=A0 fmeter_init(&top_cpuset.fmeter);
> =C2=A0 INIT_LIST_HEAD(&remote_children);
> =C2=A0
> =C2=A0 BUG_ON(!alloc_cpumask_var(&cpus_attach, GFP_KERNEL));
> =C2=A0
> + have_boot_nohz_full =3D housekeeping_enabled(HK_TYPE_KERNEL_NOISE);
> + if (have_boot_nohz_full)
> + cpumask_and(full_hk_cpus, cpu_possible_mask,
> + =C2=A0=C2=A0=C2=A0 housekeeping_cpumask(HK_TYPE_KERNEL_NOISE));
> +
> =C2=A0 have_boot_isolcpus =3D housekeeping_enabled(HK_TYPE_DOMAIN);
> =C2=A0 if (have_boot_isolcpus) {
> =C2=A0 BUG_ON(!alloc_cpumask_var(&boot_hk_cpus, GFP_KERNEL));
> =C2=A0 cpumask_copy(boot_hk_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN));
> =C2=A0 cpumask_andnot(isolated_cpus, cpu_possible_mask, boot_hk_cpus);
> + cpumask_and(full_hk_cpus, full_hk_cpus, boot_hk_cpus);
> =C2=A0 }
> =C2=A0
> =C2=A0 return 0;

