Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFBA7082D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031310; cv=pass; b=HqgSWcD0M49MhLcRxjobpJmOa+7O67oNHf2Xy1ZwaX7/frmB0W8AvW6SVaTHkeCum6OomvD3ZkEMd58IoJ/oQci58MoSzyo3QNTYRyQ76sJ+6WVifRlb0Z0FDEqBsMs/2U02cXtTAhWhzzIesRdg0Ht1C7GMOkBDWNOh7oeBQms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031310; c=relaxed/simple;
	bh=00m+DbRyqp8HvMfpmN9CYVvYGT+Po1qjBi0T8xcp3f0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=DCHGqPDiivKS8tEwnlYcfB0s1Wpdft4YhPzJdraY39wZdW9F8a37I2rVisafritYY2Xg7RsrSPFVA+fbLeBcDNB3+eUzyFkLueTrdTnTeCtrKP5MAbIH0UFmIIizLXEVRthuK9h2SDVXYtniHpKz0EEWFEFTDxgthhdei+hjgpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b=Vp82e9Wh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="Vp82e9Wh"
ARC-Seal: i=1; a=rsa-sha256; t=1749031289; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FRejhhTIFTuj4rxFeJOSz3XFZ0qEUzvBM97t7uJ3067hEZJ7JEFjGWyNrUfOeOJn5ghJlcsmMO/Cmecetp9EL389menn4U6w0/0L2Cvptz5bNFdJXMRepw/nKiLziCL3sK7WOX3VlK3fJkHIz9XT6yFPyYqDO1HB7o5v9KeAwpg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749031289; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9gcEv4agCiJl8Utx0HIyKDah065hsCsg0Lwo1J+yp8k=; 
	b=ZwGvFOXgS9pIwa0ELza71Wk1WefJ6MYt1Dh7YO8VDY0UayzB8wM6BohEr1RA7uVCCWtokijL5eCIrYVO6dsbS6gNin574RGWEcYiVVDPdWoywalst8e8meqypRCvXeVM2sMOGbzAsbLrJtBOZ4UxO4B7Yy6e4WVbl1IlFWVun2c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
	dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749031289;
	s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9gcEv4agCiJl8Utx0HIyKDah065hsCsg0Lwo1J+yp8k=;
	b=Vp82e9Wh9xGss/m1WtWrBanV3U9BlR/l9NOClM4uFlocKdw+sBYkG9iLmEsvcGao
	rZ+WSoSq2TyrE+rKxl86wIrpaoNgvMjedWXyMdd9bqnSF2hbnqJa9swLFPfTUBvvnc1
	bm4n1y6vnEJnr/7T2OEME5LYxiRh6EK/BYrgkKTQ=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1749031287445538.6080897635943; Wed, 4 Jun 2025 03:01:27 -0700 (PDT)
Date: Wed, 04 Jun 2025 11:01:27 +0100
From: Ashley Smith <ashley.smith@collabora.com>
To: "Liviu Dudau" <liviu.dudau@arm.com>
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>,
	"Steven Price" <steven.price@arm.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>, "kernel" <kernel@collabora.com>,
	"open list:ARM MALI PANTHOR DRM DRIVER" <dri-devel@lists.freedesktop.org>,
	"open list" <linux-kernel@vger.kernel.org>
Message-ID: <1973a637a7f.b61987aa482053.3031227813632792112@collabora.com>
In-Reply-To: <aD7X-O8ykIGZjHjc@e110455-lin.cambridge.arm.com>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
 <20250603094952.4188093-2-ashley.smith@collabora.com> <aD7X-O8ykIGZjHjc@e110455-lin.cambridge.arm.com>
Subject: Re: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination
 fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

On Tue, 03 Jun 2025 12:09:44 +0100 Liviu Dudau <liviu.dudau@arm.com> wrote:
 > On Tue, Jun 03, 2025 at 10:49:31AM +0100, Ashley Smith wrote: 
 > > This fixes a bug where if we timeout after a suspend and the termination 
 > > fails, due to waiting on a fence that will never be signalled for 
 > > example, we do not resume the group correctly. The fix forces a reset 
 > > for groups that are not terminated correctly. 
 >  
 > I have a question on the commit message: you're describing a situation where 
 > a fence will *never* be signalled. Is that a real example? I thought this is 
 > not supposed to ever happen! Or are you trying to say that the fence signalling 
 > happens after the timeout?

This covers cases where a fence is never signalled. It shouldn't happen, but we have found this in some situations with a FW hang. Since queue_suspend_timeout() is only called on state update, if a suspend/terminate fails due to a FW hang for example this will leave delayed work, possibly leading to an incorrect queue_timeout_work(). Maybe I should not have used the word bug, it's more choosing a failsafe path.
