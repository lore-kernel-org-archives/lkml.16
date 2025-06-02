Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B70E1C245C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748878681; cv=none; b=Taus3iN4cYyjOCJVB5CKkoH7tt2qNeD5aBwzRcwVas8Qm0JLeljfw8o3WAbVDU5T55eeoBisPgc9nPQDgGMyTbYrWeSni3YBU11+7HzcgMfPHXWniVSylDbIbRCTgbRz/F1VlbF3nGhxyXULtk0jqGXqfR6DUf1JE6xwwNp2keM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748878681; c=relaxed/simple;
	bh=46RA2zg9WevoEZjwKKYlv3xRBsM9MZ2ghSOKjuqtL64=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mhAPYh/4kFo8ogY06QUOYsNg7BiLxAKnxn8ddbAtrezHeAAM8LOZbtbkczAffZ1tWkCMUehBrEkUtDPIUNf3bkrWeCaWiLxDLXpm865NNIAXzWFh2EboJNUwYnlDayQBJOSpR/6ioY2todjPnnasqY5SzHR1i63sYBJcgUMf31M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=G3wPYItD; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="G3wPYItD"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a44b9b2af8so17356981cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748878678; x=1749483478; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x1dHqucytNvJE5sOBJHQ1JgixIBWN/66qkZtbhARHsQ=;
        b=G3wPYItDtNQPMB7L8VdHb9an4fLg1TqZ9cugyafGcfmJ5bXSTU5fxvDneyxFAFGUA8
         4+dT08njpHTAT4RaE7ch+V4PgQBKr5Cyba2zljN59hSmRTGmPPQ7afNh8lwNIP0LZgSc
         1QcIkDJ75qmvkcKGKjIxJ3D0lMwkYWL13UstteynaAGSVvhxdY2eI3X8b1VP56zebBd6
         UmO39SISNXkkKZ4tESBDcaPCWT5qolCsOqk/QZRfxysEHNAaMocQjFtnlFYZL7L0m2pg
         h6UMGbTknV/F6mzSXRncBu1KqNUmiLubh1wm6w8/1vO6WzzhGFAY5yUUNoyCcI6kZvUH
         P41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878678; x=1749483478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1dHqucytNvJE5sOBJHQ1JgixIBWN/66qkZtbhARHsQ=;
        b=AFlCrNcDxoyB8S/GwwSzDAzIUCrrapcVn6iGxlKw4ObHBJhRcSQWFHjXK3hCpRW5SI
         x6iQ5UeOBO3rfDLR/WtbwE+1oD+f/v+jyrACynjVJKYWwa3zI5uGXiOWoirT6xAaw5tk
         e1oZjQ23cYaIbjBKzSkQxNLCJSqqhs5u+0luflbRJAuGYclmIbVv76GCylQwNv0WIQvM
         nPzakrlGeEtzyofvfDlbW0EugEDbCJI0eAFRoR0Z0z+RTyvHKPC2jJ5Qnu9TfGyXEOGl
         b7yxhPUqFC8hXvZGV6DTqmN3q7xdvAnoj0P+JrLmMHh5SP3JR2dP5fTvZCpL6vatnuA8
         +wgw==
X-Forwarded-Encrypted: i=1; AJvYcCWUJhPpNOxo/6xHIdSV/8BIUNNcJaSJhtIz/a2Pe49O2Y4jh4/IXQGnWoxD4BGArnHUklPSE861vDPR+gs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4o6Pn8vQcDdOxjQiUEKX6EzWktDbeMXd0hNDGXL/X6uj6Y0jn
	41ZE2yZGvGnermNgE33tMDYSuBDNaos/B/r0V1+RsHUtLHrl/gsALJFDEBGanmvjZkk=
X-Gm-Gg: ASbGncsLvPyQfiiCwTWVZ4idE06CSENruzjs5F+0tXz22YCybz1oq4eEHdQHts/459y
	fY0lRPYqnzTwe2bPfw1E5TObjqzcRjKeBSz5W/qLxLBM20YEXWc7kyX+UYXGYazoU18t6rRnZKW
	WK6FbvKedSkA2QyOuYfdHS1hD4HDw/Kqygour1N+wVtDsLHYL+4tpL7+krvltbvjWpFgxRPGkrB
	nAg4FMLiQDxwb1lQYKCRM+lPv51iJTCGXMSaMTdfNBlWv/BwCBvNHCgfpEfm/vInviFtZdnjZJj
	wVyLM4Ey3HGAk+VCu0vr/GFyTh3E9xMCBpAvH0VZ34iTV2hXYuyqKY1H
X-Google-Smtp-Source: AGHT+IFAxvbyts/4W1PU88jgJRJyPWsVyM/w1Qedjlhc5oIe8j+5+JXf7JzKMu2VMp0D7TLMJ22XCQ==
X-Received: by 2002:a05:622a:5598:b0:4a4:3d27:77a0 with SMTP id d75a77b69052e-4a4a5ec583fmr144502391cf.2.1748878677932;
        Mon, 02 Jun 2025 08:37:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435772fb1sm56762721cf.8.2025.06.02.08.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:37:57 -0700 (PDT)
Message-ID: <01ee4dbe14917dff1e0d256dde6724f81a23ba4b.camel@ndufresne.ca>
Subject: Re: [PATCH v6 17/20] media: platform: mtk-mdp3: Use
 cmdq_pkt_jump_rel() without shift_pa
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar	 <jassisinghbrar@gmail.com>, Chun-Kuang
 Hu <chunkuang.hu@kernel.org>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin	
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen	 <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xavier
 Chang	 <xavier.chang@mediatek.com>, Xiandong Wang
 <xiandong.wang@mediatek.com>,  Sirius Wang <sirius.wang@mediatek.com>, Fei
 Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org
Date: Mon, 02 Jun 2025 11:37:56 -0400
In-Reply-To: <20250601173355.1731140-18-jason-jh.lin@mediatek.com>
References: <20250601173355.1731140-1-jason-jh.lin@mediatek.com>
	 <20250601173355.1731140-18-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le lundi 02 juin 2025 =C3=A0 01:31 +0800, Jason-JH Lin a =C3=A9crit=C2=A0:
> With the removal of the shift_pa parameter, cmdq_pkt_jump_rel_temp()
> can be replaced by the new cmdq_pkt_jump_rel() without shift_pa.
>=20
> Then, remove the cmdq_shift_pa variable in the mdp_dev structure for
> each mbox client.
>=20
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq=
_pkt_jump()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 --
> =C2=A0drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 -
> =C2=A03 files changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> cmdq.c
> index 7575ec376367..c35fe0e3a4d5 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -638,7 +638,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct m=
dp_dev *mdp,
> =C2=A0		goto err_free_path;
> =C2=A0	}
> =C2=A0	cmdq_pkt_eoc(&cmd->pkt);
> -	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp=
_idx]);
> +	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE);

Did I miss something or this reverts the change made in 15/20 ? I'm also
unsure if its correct to ask for backports of this with Fixes tag. Isn't th=
is
for MT8196, a new board ?

Nicolas

> =C2=A0
> =C2=A0	for (i =3D 0; i < num_comp; i++) {
> =C2=A0		s32 inner_id =3D MDP_COMP_NONE;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> core.c
> index 8de2c8e4d333..2f8147481bd6 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -293,8 +293,6 @@ static int mdp_probe(struct platform_device *pdev)
> =C2=A0			ret =3D PTR_ERR(mdp->cmdq_clt[i]);
> =C2=A0			goto err_mbox_destroy;
> =C2=A0		}
> -
> -		mdp->cmdq_shift_pa[i] =3D cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
> =C2=A0	}
> =C2=A0
> =C2=A0	init_waitqueue_head(&mdp->callback_wq);
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-
> core.h
> index 05cade1d098e..430251f63754 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -126,7 +126,6 @@ struct mdp_dev {
> =C2=A0	u32					id_count;
> =C2=A0	struct ida				mdp_ida;
> =C2=A0	struct cmdq_client			*cmdq_clt[MDP_PP_MAX];
> -	u8					cmdq_shift_pa[MDP_PP_MAX];
> =C2=A0	wait_queue_head_t			callback_wq;
> =C2=A0
> =C2=A0	struct v4l2_device			v4l2_dev;
