Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C009296160
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249057; cv=none; b=iH5t8XftrxHWjeR6d/UvIXa6NxokoP05L3vaNoN1NPUXDwZklq+4th1C250RWRdBju60Ma33d4qR+qgysPnTj1JXD49faE2TpFx3hMuzs4WaH9Mt9xDZbfwArMwx/x0QvcCyRlk9oTn9ovleG8rHc+Sd//Y1V19EHpFfyH6uwFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249057; c=relaxed/simple;
	bh=GbNLi+EZjPkYRvt7zqESy62VDQOUsYYsEM6aI2Vw3Ac=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=owXlFYg9OxZXqBfdRt/BDEB1mx1AcST/zX5cS80sZV/TbQ7F/NzXLoBykjgcZHAY5xLLyVFfcRGk9C7p996XzUjxJ2mevLuBSlBgJQxh/GPnP9hYsi6ORAkdIQIfVAc1dUsrlKq/QAzhOQ4Oa2WDTahfHYnFrjMfEsK606FxdwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CkjT2qfZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CkjT2qfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750249054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GbNLi+EZjPkYRvt7zqESy62VDQOUsYYsEM6aI2Vw3Ac=;
	b=CkjT2qfZ55WneZ4ULfkb8/PDorUkKjbqsG/oRuRKf8Tq5Ks3JY84Kbu9nYCg0EUPRJ0qCS
	quGVP6rSJLVlhAWCFuQu5EtchQhRgYjA65UbJiasw/3QBsRzMXcQXz9C9JC7jflyH8WzJm
	Q8UBjqAS+eVNT57olM4CPMjh0aVsfoo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-wUSajpV8NemIW039hb5uUA-1; Wed, 18 Jun 2025 08:17:32 -0400
X-MC-Unique: wUSajpV8NemIW039hb5uUA-1
X-Mimecast-MFC-AGG-ID: wUSajpV8NemIW039hb5uUA_1750249051
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ade6db50b98so659492466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249051; x=1750853851;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbNLi+EZjPkYRvt7zqESy62VDQOUsYYsEM6aI2Vw3Ac=;
        b=fi1TTpw0DmQXzhEwwiBRq/Y9MW9YBBit4DP9N9PQvCqodsTz1I7QP2mUS0weFgPCZM
         aA2Zlm+dlPe5OPkDVg2uSGD4gHbwqe/CwI0qTKCJEU7ApwEdnZyaRKbfnCJVak+0pvYt
         KSO0Ny+GLlJVceIWi+snjFl0Wy6lx1ZWEzJ3Ymufxv9oZ/eNyvqAUegfTP6bRplXg3Ge
         RLPUPN9RfZb4e8NWDEVJPs3Tew0wXwQ7d594JT8AW4ANwdLQqnLElisPlQ5+hsv56pPt
         PPaXpXcccbQnCMW+A7XOlwc3N3ix7JKGVcKXWs67ViYfeKf7cw7yaUNsr/RM4dyKyCah
         Jotg==
X-Gm-Message-State: AOJu0YzccqOBgHe1E3ndux5qtnNi7UPL3g6YbI3JhDfmkPNw42YyCozf
	H+Fm5VScILR8c29rdXF1B1eS6bdYcy7IXFnZTa/vgSPfzM/bdBTWdP70ucMgJZ+QJu9Y1/3fMoV
	i165F5Tc9e1Rw1jQaqH4Ejhod+OY26UyUcDPb3CVnnR6UQjH1+l43AnY1Ms0RXm86W/7iffZyER
	TfB4tyW9Gl9Hy7ovbpmtIBvAuxPaEcaYWVUGURo0Wm2A2L4KtGnIs=
X-Gm-Gg: ASbGncs0fZwiH9+7wXDwA8qZIXozLb58IpAdAJVgxtZJFDdz5L2UMJEyTBGNyeBwWAJ
	/IvThzmVSAorFKpiXjF7kKebc6GEOJqQJGlQyqnKndioQQd6lxe41RH/YbLMRc5Es5wZvFqJhqp
	I/8ggw+WoonADUxOHn3O2KS629xh3bP3w3/KVUFR5V+xrVB6nC0mG1v2CbuJbrEGZnbeDbrgkvD
	y20gIOcHcUoSCrhSP9GzJTdZE9dly8OyKz53DOuMcGP+b9jo9Jxth1HNaO6NSp634SMRSHZiiq1
	IT6+Eb9HbfOxhRHj+mtU7yat4HvCOP4BM5O0O/cq+DuBo0k9+ps=
X-Received: by 2002:a17:906:7310:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-adfad434544mr1659008266b.16.1750249051406;
        Wed, 18 Jun 2025 05:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBCx2aY3FI7wEWRK+AkPspj3Fa7PpXhGxZQMiPGrmFIF7fP4FDlwLVBKWh2P7l6zVQkCIXJA==
X-Received: by 2002:a17:906:7310:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-adfad434544mr1659004966b.16.1750249050953;
        Wed, 18 Jun 2025 05:17:30 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.132.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e24sm1039424866b.34.2025.06.18.05.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:17:30 -0700 (PDT)
Message-ID: <d9e3238e78a0384a6ba0651574522f44c6f2fb76.camel@redhat.com>
Subject: Re: [PATCH v6 0/6] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>,  Frederic Weisbecker	 <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Waiman Long	 <longman@redhat.com>
Date: Wed, 18 Jun 2025 14:17:29 +0200
In-Reply-To: <20250530142031.215594-1-gmonaco@redhat.com>
References: <20250530142031.215594-1-gmonaco@redhat.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-30 at 16:20 +0200, Gabriele Monaco wrote:
> The timer migration mechanism allows active CPUs to pull timers from
> idle ones to improve the overall idle time. This is however undesired
> when CPU intensive workloads run on isolated cores, as the algorithm
> would move the timers from housekeeping to isolated cores, negatively
> affecting the isolation.
>=20
> [...]
>=20
> Exclude isolated cores from the timer migration algorithm, extend the
> concept of unavailable cores, currently used for offline ones, to
> isolated ones:
> * A core is unavailable if isolated or offline;
> * A core is available if isolated and offline;
>=20
> A core is considered unavailable as isolated if it belongs to:
> * the isolcpus (domain) list
> * an isolated cpuset
> Except if it is:
> * in the nohz_full list (already idle for the hierarchy)
> * the nohz timekeeper core (must be available to handle global
> timers)

Frederic, Thomas, Waiman, would you have time to review this series?
Thanks,
Gabriele

>=20
> Due to how the timer migration algorithm works, any CPU part of the
> hierarchy can have their global timers pulled by remote CPUs and have
> to
> pull remote timers, only skipping pulling remote timers would break
> the
> logic.
> For this reason, we prevent isolated CPUs from pulling remote global
> timers, but also the other way around: any global timer started on an
> isolated CPU will run there. This does not break the concept of
> isolation (global timers don't come from outside the CPU) and, if
> considered inappropriate, can usually be mitigated with other
> isolation
> techniques (e.g. IRQ pinning).
>=20
> The first 3 patches are preparatory work to change the concept of
> online/offline to available/unavailable, keep track of those in a
> separate cpumask and change a function name in cpuset code.
>=20
> Patch 4 and 5 adapt isolation and cpuset to prevent domain isolated
> and
> nohz_full from covering all CPUs not leaving any housekeeping one.
> This
> can lead to problems with the changes introduced in this series
> because
> no CPU would remain to handle global timers.
>=20
> Patch 6 extends the unavailable status to domain isolated CPUs, which
> is the main contribution of the series.
>=20
> Changes since v5:
> * Remove fallback if no housekeeping is left by isolcpus and
> nohz_full
> * Adjust condition not to activate CPUs in the migration hierarchy
> * Always force the nohz tick CPU active in the hierarchy
>=20
> Changes since v4 [1]:
> * use on_each_cpu_mask() with changes on isolated CPUs to avoid races
> * keep nohz_full CPUs included in the timer migration hierarchy
> * prevent domain isolated and nohz_full to cover all CPUs
>=20
> Changes since v3:
> * add parameter to function documentation
> * split into multiple straightforward patches
>=20
> Changes since v2:
> * improve comments about handling CPUs isolated at boot
> * minor cleanup
>=20
> Changes since v1 [2]:
> * split into smaller patches
> * use available mask instead of unavailable
> * simplification and cleanup
>=20
> [1] -
> https://lore.kernel.org/lkml/20250506091534.42117-7-gmonaco@redhat.com
> [2] -
> https://lore.kernel.org/lkml/20250410065446.57304-2-gmonaco@redhat.com
>=20
> Gabriele Monaco (6):
> =C2=A0 timers: Rename tmigr 'online' bit to 'available'
> =C2=A0 timers: Add the available mask in timer migration
> =C2=A0 cgroup/cpuset: Rename update_unbound_workqueue_cpumask() to
> =C2=A0=C2=A0=C2=A0 update_exclusion_cpumasks()
> =C2=A0 sched/isolation: Force housekeeping if isolcpus and nohz_full don'=
t
> =C2=A0=C2=A0=C2=A0 leave any
> =C2=A0 cgroup/cpuset: Fail if isolated and nohz_full don't leave any
> =C2=A0=C2=A0=C2=A0 housekeeping
> =C2=A0 timers: Exclude isolated cpus from timer migation
>=20
> =C2=A0include/linux/timer.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++
> =C2=A0include/trace/events/timer_migration.h |=C2=A0 4 +-
> =C2=A0kernel/cgroup/cpuset.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 71 ++++++++++++++++++=
+--
> =C2=A0kernel/sched/isolation.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++
> =C2=A0kernel/time/timer_migration.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 88 ++++++++++++++++++++++--
> --
> =C2=A0kernel/time/timer_migration.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A06 files changed, 165 insertions(+), 21 deletions(-)
>=20
>=20
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca

