Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12BC1E98E3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998354; cv=none; b=IVukjtdbTJfsGc9DAXeItKEezsrQPRL3vb6X+vrDv7wIO6BnLRUI3AOFLEzUJykfQ1IZH6ZLLa25JwxEmJ5x/Q18cyIq/qmVXKNQNgy84Gn3jMjxnONi64heBjnPBvuIOfVPEKgsr6zTWMbIWaVnypjkV/0WjjnUPTEAPB5F9IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998354; c=relaxed/simple;
	bh=dLGb9BxPmPz4+QaAbGCR1J4WKA59rOVQqk/ajZAFXwY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DDr6wxgSXY82x7y7X9PpWWh0yo6NlYamLz4jXT2apQnyXSPSeTl8x4Y9irOVs16s7nVi60No0l9+HWUX5si+3A3Yyd7E1hRdyJsPNyGGS9ZsrzReZMRzljPPMXYZGrdSjITKGZyFPJqhDNaOYK4daZtpp0UpYhhQuXWPkcgjH9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S3WpawAc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZpUrv2of; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S3WpawAc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZpUrv2of"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745998350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TggPC15bN3ktclhLnQ8pO/+i0L43TK8jp3ssl5CcV6o=;
	b=S3WpawAcEc1HB8KXCZhfArSMktptMJLgzKBpPZNA7JSoKsywXqBUWZPAy3bETsvUN9OOYS
	jqEQjvQEj5Bl8ODqKkscWfl1MDIcL25b+Mx4NA+Ay9WAg1hJF8KGjf/DdnYHzq7HCfIZd0
	u9dY/jTQZtsvImVsmWuprAWrNjHjXd6j+IN0hyj5jDpEuNsDqULD2Lt1NqNcXbVf13vkUq
	AKza19zdcX78mPwygh4UMya2exU0VkONNhVhXRq8S8nrXez4730dI1KqV4c9iZL2LmVzgk
	IOBBKQygKiw31xcuMeLG82AotD8d9DdoaPGuOWe8mBU2+L4fhBoS574ZQFGZFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745998350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TggPC15bN3ktclhLnQ8pO/+i0L43TK8jp3ssl5CcV6o=;
	b=ZpUrv2ofFiWhaHYOZx4wNXm9/5tBwTE6G0gh5LicQPlqQ3LJ/aYBKOtM0w63HFlMtnsjR/
	Lz+AJY6YA4Y5XFAA==
To: Jan Stancek <jstancek@redhat.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Nam Cao <namcao@linutronix.de>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Andy Lutomirski <luto@kernel.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] vdso: Reject absolute relocations during build
In-Reply-To: <CAASaF6yGT0pDythQ9nTcn5=MHmLYD=gCNVc6dFXhWUO_iXJXqA@mail.gmail.com>
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
 <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
 <CAASaF6yGT0pDythQ9nTcn5=MHmLYD=gCNVc6dFXhWUO_iXJXqA@mail.gmail.com>
Date: Wed, 30 Apr 2025 09:32:27 +0200
Message-ID: <87selqp0j8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29 2025 at 17:17, Jan Stancek wrote:
> On Tue, Apr 29, 2025 at 2:56=E2=80=AFPM Thomas Wei=C3=9Fschuh
> <thomas.weissschuh@linutronix.de> wrote:
>>
>> +# Also validate that no absolute relocations are present in the object =
files themselves.
>>  quiet_cmd_vdso_check =3D VDSOCHK $@
>>        cmd_vdso_check =3D if $(READELF) -rW $@ | grep -v _NONE | grep -q=
 " R_\w*_"; \
>>                        then (echo >&2 "$@: dynamic relocations are not s=
upported"; \
>> +                            rm -f $@; /bin/false); fi && \
>> +                      if $(READELF) -rW $(filter %.o, $(real-prereqs)) =
| grep -q " R_\w*_ABS"; \
>> +                      then (echo >&2 "$@: absolute relocations are not =
supported"; \
>>                              rm -f $@; /bin/false); fi
>
> Should this check only some sections? I'm getting lot of matches on
> debuginfo related sections:

Hmm. All architecture VDSO Makefiles have -fPIC in CFLAGS except for
arm64, which only adds it in arm64/kernel/vdso32/Makefile but not in
arm64/kernel/vdso/Makefile. Confused.

Thanks,

        tglx

