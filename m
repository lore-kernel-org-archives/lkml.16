Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E18B2BCF5F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918735; cv=none; b=s3mFbNXnAfreZ+GDl5gSVSpo+04Q3+lD6Xtz57lGlfCOvovkFRWi1XxOKRBb2/Zoyw+FDIDgTpYQ8Kwlqw6SpeC61ui5h8MxYYi1N4YXMwUYQr42olIwI1sNyr4JjVys4h2XUtj2MuU/oRjaaYk6Eu0dekL6pIYEV3vU6vOlm58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918735; c=relaxed/simple;
	bh=xERf7vHlFIL2VDrHQAot2BofgGPAsHr+KMDATnN/iow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFlnf/d0Eu9SgqrR86pHPEXzr+Npy67uSGhspVabMI6ZVnLZFUUG4blUwkjTkADC9CdQj2HZzgKRwOwavlhjvFQF3QsBtU/mBHm3Ypf8dE6wkChz2CekEiOnaq1s7Yh1+ANjdKgB8uqT1zKwjE7hZhzq8Hp2LFsnXilUII7D6/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZNRcfM8Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZNRcfM8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xERf7vHlFIL2VDrHQAot2BofgGPAsHr+KMDATnN/iow=;
	b=ZNRcfM8YCR7uTdim8WJjJjPkkR26aVUvzBfoZQKuO/NiET785Qw46QocdqMgpRKPzjXD1/
	3ILQeMdLdp30rzrL+V6YJtnX9tbLRE1PcnL9erADt6H5fOPwopxcUdZK5t+mtPn+KmmaIE
	QEYMssKIoddxC2jeAYsl6tY6Rw7diLg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-YBmfERpSPIqnEwdUiWbqZQ-1; Tue, 29 Apr 2025 05:25:28 -0400
X-MC-Unique: YBmfERpSPIqnEwdUiWbqZQ-1
X-Mimecast-MFC-AGG-ID: YBmfERpSPIqnEwdUiWbqZQ_1745918728
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2241e7e3addso49456025ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918728; x=1746523528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xERf7vHlFIL2VDrHQAot2BofgGPAsHr+KMDATnN/iow=;
        b=dLi/FrkaczceTxos60lRhjQ6vwAhoEPCtZ8v5RyhCdxnkQbeOvKW4OC29+zwhzmsdF
         DzElLcTaClzRSbVbN760UdNIFDETD4qKwBBUGRuezMjeiIrqwZ9cW3DMK42QaLHARofo
         Q8FDmCH9gahzB/kLuUMbJkJNBIgq/4bje5b29sy9NsdsTKFnpolRYjcVmIA34R19LN8E
         DFO0Y/n/fQbCXeLfBNRClGxSrbRT6sVw9jHdjpaFy7774ltO38NQPxcMf8uMDYhZK9M/
         k9S4yeGN2EJP3KBmgleK8HVNu4UAdCNBztgLpG89OqBzgr2cfOc01uO7/g59N3AY1AGq
         h8tA==
X-Forwarded-Encrypted: i=1; AJvYcCWEanBhTLcI+li0uDCqqxowriG82xzECu0GFA2W4IlW98RR0Z6Zken+sOnfM/I8My9ZSaoQuNpL6gItwrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPvSRJqnFZIohoAhZ4nfgFGYs2aI8/rr1aSiwRwpXdD99KyXwL
	rcUDtnJLqaS8ay4Zk8Vl1QIinSyrkq7yFO0R2l0394dVX7bEp366tx4LJk1VobALdULTzmL0j6w
	7SRcTvVuP8JZc5OTHP+l7/f62RZHnBZaNmj8X88Im0MCffRDexPTmS4iAK7u0UocHMy6ajEvtwi
	bDlZTn+7nHQ619CdrXqfx3dq+CjGz2aI3QO2Z9
X-Gm-Gg: ASbGncthKrF7NU8f0zTGYc+TGGKPlXCKFXfcYcC54zYgnG1gNzwFL032t7Fs8Wob+j4
	HEjdlC57wGNfU42+3hEQWst61Yy9n4DztV9Yh8butjO6xyOtM8yraCItH8rMu74xnrsQ=
X-Received: by 2002:a17:903:1aa6:b0:224:2201:84da with SMTP id d9443c01a7336-22de6e9398fmr27498415ad.6.1745918727847;
        Tue, 29 Apr 2025 02:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVqkYKPDA3m8eZjQYkl9+oqiAw3JmlRKFlZJFTl3uMOmJOX0LPCdF+LXHVZBxZ09wACQxTwiZJFceKQ5kkHxk=
X-Received: by 2002:a17:903:1aa6:b0:224:2201:84da with SMTP id
 d9443c01a7336-22de6e9398fmr27498245ad.6.1745918727570; Tue, 29 Apr 2025
 02:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429054916.2343-1-liubo03@inspur.com>
In-Reply-To: <20250429054916.2343-1-liubo03@inspur.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 29 Apr 2025 11:25:15 +0200
X-Gm-Features: ATxdqUFmtaHxt2eRXopHROg80aacxgsBoKLG4yU5neNp4VgR_wOY5W-IVEtIS08
Message-ID: <CAHc6FU4wHTMaJqe-kijPrNQ2j83xqp-JeO3UtLiN7fCm91mL3w@mail.gmail.com>
Subject: Re: [PATCH] gfs2: Remove set but not used variable 'xattr_initialized'
To: Bo Liu <liubo03@inspur.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 29, 2025 at 7:52=E2=80=AFAM Bo Liu <liubo03@inspur.com> wrote:
> The variable xattr_initialized is assigned and never used, so can be remo=
ved.

Thanks, but this patch is against a broken version of "gfs2:
deallocate inodes in gfs2_create_inode" that has since been fixed. As
a consequence, this patch is no longer applicable.

Andreas

