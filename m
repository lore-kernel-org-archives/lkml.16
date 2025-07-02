Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C61C23497B;
	Wed,  2 Jul 2025 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.212.143.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449391; cv=none; b=HTe/4S9/9aq+EPrKQPVqbsa6M9zywsVdqfWZz0UNmpH91ufLte47poiqBWnZAQ7Qg3+t5baqTVRaNM2A2MVwbxSCvrx/uxBnFIlp2LumaQ+rSmXThjR4gCl9DgLpPwR7UP9YXQdWc6VTiUl+uW7Kf9LXvDTgJiPYZDbueFy99nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449391; c=relaxed/simple;
	bh=8Ir1fbPS564NC8LHs9yoWleW9oe2bfAsdPX/WH9NXno=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k3WeT0Gq6Ye/FFcB408XQ0iQkT5FM1Uz81sN38nd2Dl0+bLn/dvUerR/HVDkiX/XN8oHGEV9O/1ybA/svKPgbrrF0/DzQwrOPOAMg0tUjsgMvz1rzLVLKvMV869TUVuv5liVO95fETneyW+KyxHzzXzKv4iXz96Ss9GpD/qFfVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca; spf=pass smtp.mailfrom=crashcourse.ca; dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b=iaBrpt5Y; arc=none smtp.client-ip=199.212.143.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crashcourse.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crashcourse.ca header.i=@crashcourse.ca header.b="iaBrpt5Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4RQYA4LXGsUIWNPdNTtVuOGRdOSD5lcBfI1QeblMubo=; b=iaBrpt5YQVSfENcFXe3c8keYCU
	wzc9HKfk0zluF3aivIgYfE5G/RLtrK3dPANS8aJAPA8LDIRl7HaCxdmwa121sjUMqPUMMpLyDNVUH
	GuatSg110C3ejmYZyv51XYfJmy+Jz1fM+FW510fgYFLckcHGl9oR+XtZiBfYNgRVR5GBvc1bNtV6N
	xrhJa2jbZgOJ2osxxBYGlKQGB5fCpN4zQfoOz9YIq/apzElce5by9eCANwYlB+aeVv6moZLVysKGb
	/7GCveHJhnWtwgo4Ct3XWpPmFzDYzmPyPdzUN1h6zYNryWEL2+UEUxpkmKW8VtUHQlU9dCdNflKxg
	j88L0Z0Q==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:60874 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uWtzT-0000000D58N-3lT8;
	Wed, 02 Jul 2025 05:42:58 -0400
Date: Wed, 2 Jul 2025 05:42:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Colin Ian King <colin.i.king@gmail.com>
cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
    Matthew Auld <matthew.auld@intel.com>, 
    Matthew Brost <matthew.brost@intel.com>, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/ttm: remove redundant ternaray operation on
 ret
In-Reply-To: <20250702092541.968932-1-colin.i.king@gmail.com>
Message-ID: <e3cfe3dd-5edd-ef67-6651-62ecf31cd4ad@crashcourse.ca>
References: <20250702092541.968932-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 


  subject has typo, should be "ternary"

rday
