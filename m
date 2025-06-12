Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E5F182B4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749703984; cv=none; b=j8T8tyTXFtm2PFt77s/WPZEDQAR2USrxD+0dwT9snUTjMb4SqPOGj1ndRSJX/mmzlWHK/kkupKxqCxI3cyJsp7tw+iIrdOVZXU1IXX20v3cn0W5mXdsdnQjhxvn0F4TXLu5fbeVFVs87tmFmWBBugUi1AcM7mCsQV+rBVs/knmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749703984; c=relaxed/simple;
	bh=JN7PESSUpb2dkcTr3UklwuIC/3db+uAVTehxCFYg+YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfD+xl+3hEvaQjrXSfCCMpHX1q3+viMDX50sAsd0+uA1/pK22NVLE3gNlzyhXiMA/YayjxFHyKQABJZKJDSluake4C0GoyGrh+kvQnktqY4HcXjoOkQcPBTJwNDXfg91CPjYnePY3QvlaGK7kF8Xu1sAb4CNpLO7HgrE8WF82B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxKpNa9H; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxKpNa9H"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2348ac8e0b4so78155ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749703981; x=1750308781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JN7PESSUpb2dkcTr3UklwuIC/3db+uAVTehxCFYg+YA=;
        b=dxKpNa9H18qiZ6tvNSAz0QyFo/O0CYgjxzrbWCG8vcNHgpxje6TEUVMylZtMEbpuJN
         Q27VPEthzqWLeaVKfUbWmmffwHaTYNfHI9gtXgHdr6VxxSnOAhbTEq/rB70k9gITnHmH
         ktWZ6oRiYsJwCW/MMRGTreFeKDe7sYFBYgvTaEldOOOiM2DlTP7P5sWrkTMl6wVRx8Mr
         0oW2IvVNshJ90bBbGvsI5VgIEtmO7LmMsWiqA2W+RorZB2+0CMj8WnNjRX8wzFAKj5sS
         Bs7shYT7j9uzQ8dl/flyPtrkdwPuv74pDUMObzgOEclhbPRfdsP0Td4bJwNEZk+l7Z0S
         mIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749703981; x=1750308781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN7PESSUpb2dkcTr3UklwuIC/3db+uAVTehxCFYg+YA=;
        b=IW9Zfmwlvx5SKyg6zW/wVU4aa3FBgfCBBVMyQ44yi1dnO+Bcdvv27vo2K4jkKvIACI
         5b9SoCe95CPVRdz6NkfBjDD4GOXlDbFOFRJyUQ4WSP5wm7O0k4+u/j2oLkPpVmdEWj4G
         MxpiNjEW5TD2YaUym9kz24yQ1lTxcq0s6Txgy1D8rYL43dxXaPwA4oNQjbKjS5XCbFbg
         aWTvFKJdHzWNX2vvfDA2aatFrgdsqcm8LdNvQNvqg4tsYxciXJtNcRyk5WZY6nIjhTUa
         tEz1m61QkoF9TRoXsZgyerYqm1R1W5b0jf2RzlgZKMwjPrecAuCYmFyq203CQ9v6a8Sz
         Eyjg==
X-Forwarded-Encrypted: i=1; AJvYcCU45mOvUHkqZ53aBmMFTELE+7R2yUL6ibyszbuTAEgiMLGh/kZ6Wo/PqVavpyyKint1vbUV4CUVXj8oAj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiwQmXNryTPka7sxy5+JP6H3YU9efcaIiRnWq5kp7oKSBjiYCo
	cOseKIIAzUYVOP6qsMmeDLS6u8oICSdYAy2/VwEt8kIsmdDx+Nr51KCd/V+V6p0xXpDVV0JnILx
	BMuVisfRfVTDC7t/f8ZWw7hrLIl6Suf4H6oVVbPbl
X-Gm-Gg: ASbGncuhplbq/U18zd485DUaRIu9L8qJPnuBpxhTDUOW+g8PCagWZePpri3O+cXi3p4
	wZQEGoVLcjm35qsNmaHYp5+AiSi3ir644FhOs8qncSY3i6urVDk6dD7MNTzz3R9K9GH0XBz1Azx
	/CcduizAwkQc++Fb8A9odxGezEC4sm+w6irAIheC7Nu1nG
X-Google-Smtp-Source: AGHT+IF9sI2+TSVjeDsyCsMhNK2tYq652eey2qbdj9oGkvAU4h9hMqqw9fQg0pUIUw6GrHibgaGuCKYfworr/47Spj4=
X-Received: by 2002:a17:902:f54b:b0:231:ddc9:7b82 with SMTP id
 d9443c01a7336-2364eb2b4ebmr978315ad.13.1749703980736; Wed, 11 Jun 2025
 21:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610150950.1094376-1-mbloch@nvidia.com> <20250610150950.1094376-2-mbloch@nvidia.com>
In-Reply-To: <20250610150950.1094376-2-mbloch@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 11 Jun 2025 21:52:47 -0700
X-Gm-Features: AX0GCFvzBtcSK4oFAp7AxIqQXQSZWU21N-dciM4Bw9ZhMgTYOZ3S9uS4MIxcR6Y
Message-ID: <CAHS8izOzZnNRbBvMohGzB2rxhuLun8ZcPKg38Z1TbXo3stqZew@mail.gmail.com>
Subject: Re: [PATCH net-next v4 01/11] net: Allow const args for of page_to_netmem()
To: Mark Bloch <mbloch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, saeedm@nvidia.com, gal@nvidia.com, 
	leonro@nvidia.com, tariqt@nvidia.com, Leon Romanovsky <leon@kernel.org>, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dragos Tatulea <dtatulea@nvidia.com>, 
	Cosmin Ratiu <cratiu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 8:15=E2=80=AFAM Mark Bloch <mbloch@nvidia.com> wrot=
e:
>
> From: Dragos Tatulea <dtatulea@nvidia.com>
>
> This allows calling page_to_netmem() with a const page * argument.
>
> Signed-off-by: Dragos Tatulea <dtatulea@nvidia.com>
> Reviewed-by: Cosmin Ratiu <cratiu@nvidia.com>
> Signed-off-by: Mark Bloch <mbloch@nvidia.com>

This is slightly better, it returns a const netmem_ref if const struct page=
:

https://lore.kernel.org/netdev/20250609043225.77229-6-byungchul@sk.com/

It's probably too much of a hassle to block your series until
Byungchul's change to this helper goes in for you, so this seems fine
to me in the interim.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
