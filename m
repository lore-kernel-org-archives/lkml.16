Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5117A30B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159704; cv=none; b=ZTOr+TtcbT3IA9d02VtPgRpxAGFa7LzbZn94ErCc5JvHTNIu1B5Vd0vTUDE15S8FTVsps+nWvZw414KAg7OKFURfr1m2AGifj0n67El/U1EtqRCQEoeIcxayXO8Lkko4Dy1ToftJLkPdqln2WvKz5TPLwCYD8rA8/eXgKanrg4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159704; c=relaxed/simple;
	bh=4vR8XRswEcbeL+RPvYmMfrweBQ190iuWvm0Je9EsKYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVJfjPQxoulzbJ88MsKcIt0PmmJUNye4O71d6a8g5fPZLQk+FC04K78W8BSm5k2D7qss0gCQCG+ffbY9eO7iSjXQmgOlqan2Z2baxuJm2jEEM8CwS6NpkCywyUj66z081hcdU+XnA1qyGRzZqVIO741JPgvhzzUsT+G12mLPDJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/9r3fIP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/9r3fIP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6976AC4CEE4;
	Fri, 28 Mar 2025 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743159702;
	bh=4vR8XRswEcbeL+RPvYmMfrweBQ190iuWvm0Je9EsKYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/9r3fIPYj/ps3KXy1Z6/3LE2y6u43k3U039GsWELz8dEOKJ7+SCoLif7Bca5eyxU
	 A1qBazYDMi6pJdhU3nkmawkR1TmGh4PnGgOUP+OP4tezzTlv9xBCy52Vp4ajIGrGfo
	 ya1XNLi0xNiNiBJO3s7Qv3+Dw+W8Fn8ekOoZGwooQiP0PmNMKcL+jHl1dsOFRPyjYv
	 oAHZeOWB5dqy/CyUkY8w2CJTISMkryuvbaeWYpZTMTbNpQBT5Z6giZKLNE+zX8GaUG
	 MU+WS7RJrBymSIRHcR78Ste4fouYaYTcM3AHb66Yb/6VteeANa1GqtwPembSnOkHcd
	 6MrbuUd3BqKyQ==
Date: Fri, 28 Mar 2025 12:01:37 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lyude@redhat.com, sumit.semwal@linaro.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/prime: fix drm_prime_gem_destroy comment
Message-ID: <Z-aBkc2p5BZLrBJH@pollux>
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local>
 <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
 <Z9rSTkXlub-JZAz0@cassiopeiae>
 <Z-P4zQ1464SeZGmB@debian.local>
 <94eeb36a-9aa5-4afd-9ba6-76e8ace10122@amd.com>
 <Z-P84iMUP4NBAY7k@debian.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-P84iMUP4NBAY7k@debian.local>

On Wed, Mar 26, 2025 at 01:10:58PM +0000, Chris Bainbridge wrote:
> Edit the comments on correct usage of drm_prime_gem_destroy to note
> that, if using TTM, drm_prime_gem_destroy must be called in the
> ttm_buffer_object.destroy hook, to avoid the dma_buf being freed leaving
> a dangling pointer which will be later dereferenced by
> ttm_bo_delayed_delete.
> 
> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Suggested-by: Christian König <christian.koenig@amd.com>

Can you please send new version of patches as a new mail thread (not in reply to
previous versions) please?

Otherwise,

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

@Christian, I assume you will pick this one up?
