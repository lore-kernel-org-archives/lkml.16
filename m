Received: from mail-10627.protonmail.ch (mail-10627.protonmail.ch [79.135.106.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860672135DE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749836401; cv=none; b=TxRtuxYJ9WDO4XVxVbNJCJjkUfQU/T+huL/sOsVSYjlHGYjA3ISeq2zzhS/+vASdjZnZiD7cHUaw/HCJRkmHueNLUSGzje+B7eE29ejF8mHlX57+jgNwQ1If4FNhaX7l0b1eMy/jFqPrOibJYdR77APTZJEu+Hguinycw9ULkac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749836401; c=relaxed/simple;
	bh=NC41cpy52DzaDtBOPY5QmIFCy0q5TU1I1q15X5jPUWg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qz4mpGtkUfV18CsMP+E9zgJErX1Cu+ovWyGUHcPDSu87qTt7nFbBPFeuhR1ThHGCszjjRjJb7Hu/aVSBtdzSHkBozFb7rfuTlagvXrOoXSj4+Qu+cNXtX3eJQf+iJZgfRY2k74Xzf28FpudRsSsC0CSg6EB2N4jSQsZkBewQZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=NX6t38Jg; arc=none smtp.client-ip=79.135.106.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="NX6t38Jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1749836390; x=1750095590;
	bh=NC41cpy52DzaDtBOPY5QmIFCy0q5TU1I1q15X5jPUWg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NX6t38Jgonr+gJBLj+ZWpf/03vub7x5wttG1RMkVmihhVgOipZkGijm1J0bPgSvXk
	 L1tyrm5oWR+5JSH7SoZP67KNfqQ0ntPsohtYhdouT61dwkKafXraGToRY6jzOdjvng
	 4A9cXS3Jd2GTns73gDCHXOqLzTgloCuJ4IOfqINmsHIhKONboSsuXHjimdk/l6JR0C
	 v3rJVhbqawpTJ1yP24iM9B7Jo6upJMQtHeI9vz3e9mSuzCtdONv/barGZ4DJUNtFEV
	 8XrO3FDwzxr51+Oox3GAF1sfrwJK6ICWlxWh3qBnqcx5B6nFnLnvfmjWn4JmVnamq0
	 jaKR4XdO3O5sg==
Date: Fri, 13 Jun 2025 17:39:43 +0000
To: Vincent Guittot <vincent.guittot@linaro.org>
From: dhaval@gianis.ca
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] sched/fair: Use protect_slice() instead of direct comparison
Message-ID: <G3zYtTToApj7JI1cZHI1011n7a0hv-rWkAdhb2Jn7mAhGdv28MF9X5DyVqdOh7CtpN--YcvURP3fkB0SY1DERKLzcmA27F3cEhGFutJ7JRE=@gianis.ca>
In-Reply-To: <20250613140514.2781138-2-vincent.guittot@linaro.org>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org> <20250613140514.2781138-2-vincent.guittot@linaro.org>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: db84cbe9496e4a83e66757db615d404e8c9f3c48
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Friday, June 13th, 2025 at 7:10 AM, Vincent Guittot <vincent.guittot@lin=
aro.org> wrote:

>=20
>=20
> Replace the test by the relevant protect_slice() function.
>=20
> Signed-off-by: Vincent Guittot vincent.guittot@linaro.org
>=20

Reviewed-by: Dhaval Giani (AMD) <dhaval@gianis.ca>

> ---
> kernel/sched/fair.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 83157de5b808..44a09de38ddf 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1178,7 +1178,7 @@ static inline bool did_preempt_short(struct cfs_rq =
*cfs_rq, struct sched_entity
> if (!sched_feat(PREEMPT_SHORT))
> return false;
>=20
> - if (curr->vlag =3D=3D curr->deadline)
>=20
> + if (protect_slice(curr))
> return false;
>=20
> return !entity_eligible(cfs_rq, curr);
> --
> 2.43.0


