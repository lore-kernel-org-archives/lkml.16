Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9495200132;
	Fri, 13 Jun 2025 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831191; cv=none; b=BNOuIyI4fw7sNT4vupIhjIkg9DlHm9Bn9D7Kx6f/obp+pdYCpYsdYGlCb8Oi5j/XDb38vTZoU3cGa2NZk6VzuW39+Quol2FxtUJR1bVShEh4hEtDuwVUC4laVrJFIT2qMqqTDcSmepDZcvjrCPngrqtoRjBtAZ/bUr/uoGbqZ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831191; c=relaxed/simple;
	bh=8pQuheicsXT+hM8tp9m9C5NSjcZ0mAhehkxnWitrpno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0z74KXSxOeA7204/nnOiO7H2eiuZ+qJ3Oh+MAxMnNWT/Ew/ZE/bo4By/g4vP+5Jy9nR5hRiReM7ZS/n6KcN1LgM7tdm6nLaZomDDYUftkThfsfUA+L/8UxFXyfFsEZraRRU6opIP1pwGYi3v5t8d5mrF9CsX4CbKF+6W9A6IpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHlmZJOX; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHlmZJOX"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so404267366b.3;
        Fri, 13 Jun 2025 09:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749831188; x=1750435988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+VwKYoq4K6K/5yHVH5q1Qz6OOz6+/W6hIZOp3rpGbI=;
        b=lHlmZJOXHYXiJSn4q1s47011j4v23G6KtXyn/NPT3YijmHMjkvzFidp7ML79F8QiRA
         3MeNzwFYBZeuMY/+pVGU0GViVYtdOnCw+XddXctHQP3HjuRCi3IoJ/EpQzyiSN8x7EAm
         YLHjVH2Fn23cr1wcU4UTPEW32YxApcI9ifZ1ndkEUODD4M2zw5TOY8+akEWlKdNUxW1v
         mq7nI294rE6o21lwNlpY6eoCYHyn8BnAnWk2LtiSzKkTLM1LIyCKqLNEHJSZD50E8MHX
         2+NGUdjhE1CBjBKa/sgsVELgiNW33ffaoIZLnaH4yJh+CeTjBfDgEzLgFgMtSo575CbO
         QanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749831188; x=1750435988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+VwKYoq4K6K/5yHVH5q1Qz6OOz6+/W6hIZOp3rpGbI=;
        b=RG1M/4p60jyvJvU+5bXhugyDnnXwoqg/iPe98reyxsJBlw/1vZjbC0Od9G8HMfNI4d
         8GWqiYCTOJatLq9D/eYcE0MtBVoW0TqILdntiN/psqTNamKxo2DAcgiAQyBheUNsyLmU
         6r/ryDtC6unmbPy1KLOrDJG6E/ssvhL1IZZBQTEKXertUIYBnHX0l8OYuAHSYszcPb7a
         SQqMLfdElDRXPMjABLBZufzDps80uqY+BvUKNFCySquyWM3x8SXf+k8PSYBIrTQ+Lz93
         AJDOWgIM+48DjJxm4oUgrt12raMyG47OL8vSJVeHa0eHtLhtPX/kztoZRpZ0dSYPq1km
         B3cw==
X-Forwarded-Encrypted: i=1; AJvYcCXFyWm7+IB/yZbv9bYV2dEVxzkHcc/U2OnSRGVck/aA2e4cBSjvT9mfGNb/+Qm7ooKuWx7zcE5/UgA=@vger.kernel.org, AJvYcCXpsLA7JL+362KcOtpyCUU5DUJmT/dnBSsvvsOyVvy3PW/IU29fIlrDA1FsalJtjEf2arHhudfnGGbjKbpO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3vpbw9qjZQR88GulayLhd6g3VVVQ+Tj0DOnUTFHRD4u0YxmYj
	IGLcop5mNIFDvl0rNliml9r84wLms2tqHeCr/NL1tVXH+YhT/8LmF+Ssc4MqllYKP7uxUOTKTEB
	/FqHZklEUzKNsNm49xxX05zulyD1aAn0=
X-Gm-Gg: ASbGnct5LTzxCiTjbB4E9KNxTvH/XsI50eY6NeSTRFqot7AGGQbqGTJTc/zhh+2kJ6s
	qbtBSYTG2M94Lb0o5bgZd/jtPps+YNH0zndIURdWVvVwwhlX3WULdo2HW+fIXo4tJFttolkLkvS
	vbVe2L5rC3QgsU2pCqR1sTJJiJvKufYTh6fm+ab3Y1QnfFPcUJDpRZA8Dfv2Aor/38ToEyk8yHP
	qVH
X-Google-Smtp-Source: AGHT+IFfbm2ILbzNqaWeP+BPo+t/ZcGuAqPpA1yn78O51dNA9iM+X1CfAQz9tF1EH2JVkFqRrrq4xtngmwFGJQB2JJE=
X-Received: by 2002:a17:907:970f:b0:ade:4339:9358 with SMTP id
 a640c23a62f3a-adec5622d75mr357900366b.22.1749831187984; Fri, 13 Jun 2025
 09:13:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612181330.31236-1-bijan311@gmail.com> <20250613095525.1845-1-rakie.kim@sk.com>
In-Reply-To: <20250613095525.1845-1-rakie.kim@sk.com>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Fri, 13 Jun 2025 11:12:56 -0500
X-Gm-Features: AX0GCFvh-zD9qUo9qgFI77L0Qw-QGCNYqP0mhIl0FpPrr_nZ3onLg5ACPH5Ji9E
Message-ID: <CAMvvPS7qgos5OFo=W_FftEn=3QqbsxKCR_-3_eiTQeqne_Yj1Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data
 across nodes
To: Rakie Kim <rakie.kim@sk.com>
Cc: sj@kernel.org, akpm@linux-foundation.org, corbet@lwn.net, david@redhat.com, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, bijantabatab@micron.com, venkataravis@micron.com, 
	emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel_team@skhynix.com, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 4:55=E2=80=AFAM Rakie Kim <rakie.kim@sk.com> wrote:
>
> On Thu, 12 Jun 2025 13:13:26 -0500 Bijan Tabatabai <bijan311@gmail.com> w=
rote:
> > From: Bijan Tabatabai <bijantabatab@micron.com>
> >
> > A recent patch set automatically set the interleave weight for each nod=
e
> > according to the node's maximum bandwidth [1]. In another thread, the p=
atch
> > set's author, Joshua Hahn, wondered if/how these weights should be chan=
ged
> > if the bandwidth utilization of the system changes [2].
> >
> > This patch set adds the mechanism for dynamically changing how applicat=
ion
> > data is interleaved across nodes while leaving the policy of what the
> > interleave weights should be to userspace. It does this by adding a new
> > DAMOS action: DAMOS_INTERLEAVE. We implement DAMOS_INTERLEAVE with both
> > paddr and vaddr operations sets. Using the paddr version is useful for
> > managing page placement globally. Using the vaddr version limits tracki=
ng
> > to one process per kdamond instance, but the va based tracking better
> > captures spacial locality.
>
> Hi Bijan,
>
> Thank you for explaining the motivation and need behind this patch.
> I believe it's important to consider the case where a new memory node
> is added and the interleave weight values are recalculated.
>
> If a new memory node (say, node2) is added, there are two possible
> approaches to consider.
>
> 1. Migrating pages to the newly added node2.
>    In this case, there is a potential issue where pages may be migrated
>    to node2, even though it is not part of the nodemask set by the user.
>
> 2. Ignoring the newly added node2 and continuing to use only the existing
>    nodemask for migrations.
>    However, if the weight values have been updated considering node2
>    performance, avoiding node2 might reduce the effectiveness of using
>    Weighted Interleave.
>
> It would be helpful to consider these two options or explore other
> possible solutions to ensure correctness.
>
> Rakie

Hi Rakie,

Thank you for the reply - this is not a problem I considered, but it
is important.

I think option 2 is the correct choice, and is what is already done by the
policy_nodemask function we use to determine what node to place a page. I
do not think it makes sense to ignore the nodemask when it is explicitly se=
t by
the user.
However, if we decide to change the way we get the interleave weights to be=
 from
a DAMON specific interface, then I think it would make sense to only
migrate to the
newly onlined node if the user sets a weight for that node. This is
because in that
case, the user is explicitly telling DAMON to use that node.

Let me know if you have any other concerns,
Bijan
