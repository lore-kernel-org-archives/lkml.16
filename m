Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7C42D4B78
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778597; cv=none; b=GxoX2vz2LX4cpzSXWU/MHU1IowhI7L1nL3hwRzBTbUj74xrJ9HnbH9+raR2cug4UJ3dtpjV8pV8/eNhgAykTPOjrH7bNUweAv/QTs/Ij7GwklqzGRZtM/a6JbAs/nf6IcExQmxaSRacz1pSMJ1zwu9eUHSyxnNOLwl3/MP7XbVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778597; c=relaxed/simple;
	bh=OsHzL2QmtaBFsR+icUHxcUjIVSkn08E6eAXih9sMNqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvBp86T82rp5PWOnmiamBvDJWUH0r8I+L3ZOKCGVoA4ruBkuukubq68nZf/TQC1x5iKheVuyxuGN8klwxwvtHGLoLH7XzekpbowocPir/xYk/KZSrMvaO7y4z5THn38nboJKMC8DXE6l6bX7y6a16GZ5DdOhogHXj6ZlDv5tIuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UJDGqvKX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UJDGqvKX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-237f270513bso167445ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750778595; x=1751383395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsHzL2QmtaBFsR+icUHxcUjIVSkn08E6eAXih9sMNqw=;
        b=UJDGqvKXizd0bPQVkaruWr8ZF1ij+HBzYC68KolzrdVma9a9TrhrfUCx0LGO4vF8px
         AewmRkR0zxzsKTsCcdnuCNqlhjwzwEnPEAyaviQRiywSfKHhiilfCKkXq+1dPEZcPhRs
         ZSkQsLbp+OCsfRoT3VqM8+Z3hrftJ4tZ9SytFwvX3b/Gu7o9hjUfnJCIO10jASAO4xeY
         MJuA0aZsRsbM10waYI4n0FuaaqZSh3dCAL21w+Ln3s9waJre93B40MOkOm7LDFwXMdsC
         c/QQ8Adpxbsj8SkRlBLsFvMWAwW1hlWIo0lyHEY+WgQYpqk9nbLbyNrfW48B6CvWN2JK
         vURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778595; x=1751383395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsHzL2QmtaBFsR+icUHxcUjIVSkn08E6eAXih9sMNqw=;
        b=NYrXJnM281HRKAHu/3wv1qx3XqR12tzsKr/x7oMeJ/EjGQA0S0djO8pbf8UdT7tdAO
         4GxvhOVfpHQD/XPTLdJHMxB0FHp1fPIz+GuxdxaK70zS37a4jQLj2BCIbSaKMzg7E+TS
         7dfwtMTNtfVUNTynyltfrPNgB2Qr4gz9PqiwT2XayyFXtgSMKOKSHPHkJtxHJUGl0yJE
         t1v/a27SUFTisVDXxyT+cV438o4pzXrhA0V3rfseF2JiNz3SCIKsUzsTen1LRnX6v4mP
         pi9pDYaUl9QDOLOqQMPZVFRs1OA2bndlajKiWV1g5g1w+w7c3CR8a93rVMJBhBDG6rOs
         IxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmvIthnn2tFI5PJt7lYtPuUUo33HWWAKIxlurGrJB+zq8SNOmkxKr9Pq+rCQuNc72MvVFfaGFNB9dmljs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFD1dPjXAI7Bv67VheyMdQgt8TZHW1KJrqNWcEnbTJspQVvUYT
	Wg73nL7A7+ioFoF0MNAkuy1pGRi1qzLFcSeNHCotKGjj1s9iBt72qjy0lu+gmw5B4fSNrk8c+jq
	3x9tQCPA4JX/NCxLeuSLcKDbdqakqS8yKOMfFKaAn
X-Gm-Gg: ASbGncubGyU+C9MeEtmLzUpbP25P6bq2+hyLIE9NJPVLcJDKzHqS5eSeIPj7aX1X6aI
	QzJmdLpuX0ya89IKPtogB47oK+HX+ryN+fkbEGOuDr/5c5w+/7YnNwOIqIyOna/adV+aUTfK6o0
	RSf89TBFxC/pcwjLfUWKGsILyvSNsD+QQ9PDUHdR/0IHT3
X-Google-Smtp-Source: AGHT+IFuV+2Ga9TSOFwnFolgarENN+7E/Cva5lJLhIeCCIC7hFMvve9M0hq1gAoD+N3ejaHL0KTuSlx8P61f7rAinTQ=
X-Received: by 2002:a17:902:d551:b0:236:7079:fb10 with SMTP id
 d9443c01a7336-23803e7f04fmr3511785ad.3.1750778594186; Tue, 24 Jun 2025
 08:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624140159.3929503-1-yuehaibing@huawei.com>
In-Reply-To: <20250624140159.3929503-1-yuehaibing@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 24 Jun 2025 08:23:01 -0700
X-Gm-Features: AX0GCFuB2FfqPxAOT9GIekGHD_Ki0PPJ74vNDf3L0e2L2VE867xDanye4TA_ga4
Message-ID: <CAHS8izM-UsaMCmY0Rqudg8-b8ObFFP9Tq0zD8-L7YB7CG2CURA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: Reoder rxq_idx check in __net_mp_open_rxq()
To: Yue Haibing <yuehaibing@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 6:44=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:
>
> array_index_nospec() clamp the rxq_idx within the range of
> [0, dev->real_num_rx_queues), move the check before it.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Fix looks valid to me. The current code looks wrong because the
dev->real_num_rx_queues check is done twice, so we'll never hit the
NL_SET_ERR_MSG.

One side effect of this is that userspace code that does an out of
range rxq bind will see EINVAL before this patch and it will see an
ERANGE with a netlink error message after this patch. I think this
change is fine even though it's a minor uapi change.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
