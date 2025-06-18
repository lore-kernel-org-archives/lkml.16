Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E27D198A2F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236134; cv=none; b=dmKkjVxzesBD94iYFJ4W3vM+tjjVgTXravDfz7Ky6QWoPP1nnj3J6TsEQwfT9DpvpRrkGtZP9YUorkij/DHjndInNA9t/QBDgMjCc8YQdWbNtu9a000RfKz+g3o8VkczMWndGVN8YxNYWDRpuCM7ytsKQVKQg02c9CDkhE00dIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236134; c=relaxed/simple;
	bh=tLuMERFkhkMvyc4RUg0kVrXZFLmMUYPq2RC7G9Wn0DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAPp+MUMQQzsWFzfqjIiOgeDVv8YaqinBJsHqPtX0uW+hVg6wxFPYL8GuyHl02gB6wyx+8n7JgzowEVPvX81/yPrSUGCJlg5Nlzi9W3wMhvfsYa2HYJ+FaRHAsLV209lQwUYw7n8Mv833FHsK0I/4uLXxJckgx6v4tCvhr4Z/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=geWLGPvH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="geWLGPvH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so44486965e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750236130; x=1750840930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E4gyiOM+R6q4LAtiBITFj3HVk+KRLwjIRJzv+V7V2gA=;
        b=geWLGPvHltxTWo55IuvC5G6SPamU78oFFs+0dSyYlzrrGaLQSW8C83aZfN3RtGdbl9
         aoXTlpMp97QxAvLmmZ/EoIGI3MswiwU2qJFr7+xT9Q1GcLAJ28wELV3l14LaSRcaaMHt
         4T1u/G/HK+Q8jwYXCWAjeAIqiWtqoOqdYaR7Opk9Lf1vmMThyyGNeopXQjiOBFQ70Cs0
         o7TQ/KXcoeQ5PYp5pK4MSt2+VB0yqEoSHmgvcEITsPQMlYfqk4jnoIw+eJk151XRx2ue
         Zl7cfrvcAkFmpo/arg4aWgmfrVtcJc0fnw2zEsbHEaKdeex1VDMq1WxUypWQLDbYveuO
         P0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750236130; x=1750840930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4gyiOM+R6q4LAtiBITFj3HVk+KRLwjIRJzv+V7V2gA=;
        b=JmHozTvtbFzVobeawQD49Diz3rwcpUz6YxcscOgTtrTCp7Bn8/ork9z35EImVIDj4d
         a9NvPQR3O3V0jbqZVGIvDF79z6iCnJp1rxcjqN1AXTCAYodWRTSWFDCGkZZEREn988TW
         dyoCiWkJiOMouMHPVT6TiqiaVN6cwLPiiJnsuAPtvnuX6elUHDRUILbS0Td2SKDPTBJR
         6XThOwrMzuswh7SwH0BHjbfjYmh7aaC98SB2ThtnsHHnp0IxilTAO29mrMrY/d9fsuKl
         xUum6R1hNkh3b+8skh1O8QTooAJW6kwUy40UtZ7e5gdgPSRmyJkY1cYjOy8a3RG9nxbc
         H6ew==
X-Forwarded-Encrypted: i=1; AJvYcCUBjcCLuaUZ9rgE94FdO9xgKCPnEDJLE7aSU+NygZvcEQZZuJFquaS7TeM7AyDNiRcNoqxvP+aSK2eb7ZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YynzAQDx3U38occFmrUTj7/fk701JjkZJxCCscUjzZYeklwxqBm
	0cSqe84lsWo7Lhq+7NaNbflaezdxcTEC49TXI//FyP9yBYSezMQuGg8c+D/gE9n+Jwk=
X-Gm-Gg: ASbGncuq2TgtwDa/jIE1XQ2BuYvCwtIXrSnn6Dzx2JpK8WH2rEVo0f/H/IAukkw9XC0
	j0O4qdPvCYs9d3u0hHFV19kx2GVU40XBGzl5PQgLYDQxNWRVW2Ar/7aMAK9REr25Fy3c4M9XSiU
	ybuFy3N2nq1oDDngi3uR8dBvrHKT06CxgndermzDN1qfbNtrMlP+Ypb9ewI5XgxJOor4d93rwN3
	VTurC+ndHCiO/lbFM/lrzYGfdrLyNdMJAlRLWeNsfob4YcREm0V1yQY97oULLikNhjnNfPMeTOF
	xyzwO2R59tuUgFfWmuHJPcX5FwbKLjy0oDXZI4tI7FSs7z/fsBkJHbB330BkyyL7
X-Google-Smtp-Source: AGHT+IH87VAwC/pIDh8SB1lVx0PiK/TX81W5Y3bCglq4KyJ4mokgrwmhsvbaOnDPi+FmoaFjsfeO5Q==
X-Received: by 2002:a05:600c:5025:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-4533cb5ddabmr168887675e9.31.1750236130292;
        Wed, 18 Jun 2025 01:42:10 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534172d2b0sm131736755e9.35.2025.06.18.01.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:42:09 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:42:08 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Chen Ridong <chenridong@huaweicloud.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, rafael.j.wysocki@intel.com, 
	mingo@kernel.org, peterz@infradead.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lujialin4@huawei.com, chenridong@huawei.com
Subject: Re: [next] cgroup,freezer: fix incomplete freezing when attaching
 tasks
Message-ID: <sfmtpva4z4jxrlmmeyigz4n7wozfveii3cuaks3s4dgf6noyfg@gutbimmbjfbb>
References: <20250618073217.2983275-1-chenridong@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hq7nl43p24s2oqa"
Content-Disposition: inline
In-Reply-To: <20250618073217.2983275-1-chenridong@huaweicloud.com>


--4hq7nl43p24s2oqa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [next] cgroup,freezer: fix incomplete freezing when attaching
 tasks
MIME-Version: 1.0

On Wed, Jun 18, 2025 at 07:32:17AM +0000, Chen Ridong <chenridong@huaweiclo=
ud.com> wrote:
> From: Chen Ridong <chenridong@huawei.com>
>=20
> An issue was found:

An obligatory reminder to move to freezer in the unifier hierarchy if
possible. Thanks for the fix though.

>=20
> 	# cd /sys/fs/cgroup/freezer/
> 	# mkdir test
> 	# echo FROZEN > test/freezer.state
> 	# cat test/freezer.state
> 	FROZEN
> 	# sleep 1000 &
> 	[1] 863
> 	# echo 863 > test/cgroup.procs
> 	# cat test/freezer.state
> 	FREEZING
>=20
> When tasks are migrated to a frozen cgroup, the freezer fails to
> immediately freeze the tasks, causing the cgroup to remain in the
> "FREEZING".
>=20
> The freeze_task() function is called before clearing the CGROUP_FROZEN
> flag. This causes the freezing() check to incorrectly return false,
> preventing __freeze_task() from being invoked for the migrated task.
>=20
> To fix this issue, clear the CGROUP_FROZEN state before calling
> freeze_task().
>=20
> Fixes: f5d39b020809 ("freezer,sched: Rewrite core freezer logic")
> Reported-by: Zhong Jiawei <zhongjiawei1@huawei.com>
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>  kernel/cgroup/legacy_freezer.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--4hq7nl43p24s2oqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFJ73gAKCRB+PQLnlNv4
CMmyAQDJRxBSTIfHPzpApy+1rHScxGgAgsN0L474auzdBb6b9gD+Nc0TpNMWLQFw
/yFDdplMCfczlpqXSh4ubUeOqUiaqwM=
=6f0q
-----END PGP SIGNATURE-----

--4hq7nl43p24s2oqa--
