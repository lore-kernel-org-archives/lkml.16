Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF0E43AA8
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746358258; cv=none; b=OO2zA/cJq4rO6sxzAqDng/p2FPS36j1WSfQXJAHMqqhjooDWW7KNXEHvjiR0NB5AdEEPi5Iy7tcnWgOkNUqvVuPNs7qPnRoAuaggPLYx+TdMSSY//LNakPfhc6Sgr2yOWcG/iS+5WhPx6Q3R7Vx2qBdRIy2rti203odfzaHc0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746358258; c=relaxed/simple;
	bh=Ht81KqRFYdhj6o3Gw8ymvJM+JmwvnLJV/L0dXKOReK0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hmZeZ6p8vGULpGHnqkNU5VWcPpXH9W0kiSS4vn2bZnVMp6OQfL5M0PaKaik23FemWpkoKHirq8Ach/k6+MR70zAjEEz4VrWarSPF8lncrzIhNRlTOXV6i32YshPviWZan/zVohOBtL063Zt8uWEeFIkpNs3X7yNNqUeAc/TVfEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fhrs6DbA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fhrs6DbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746358254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EazkyjVOz4TwmCMWeSQ28sdm9rYVdcferzElC0nH0h8=;
	b=Fhrs6DbAv8XuG/8iN0V6AM5wAmSHgM7u+AhUpRI8LuRwcgWfc3bUls6Pr4QeGdhZ2u+u6y
	eYQ4v8gWAwJrWYJ19W/3VTFMyQHCI6pzD1C57SnNM3bAxvgTwg6T5xPVJduGIcWLfp0SoQ
	2EtfpgSnH9fLt8IT2jBlr0nOPHhKSTo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-MF_yTTSgMg6Urhq-ULfCDg-1; Sun,
 04 May 2025 07:30:50 -0400
X-MC-Unique: MF_yTTSgMg6Urhq-ULfCDg-1
X-Mimecast-MFC-AGG-ID: MF_yTTSgMg6Urhq-ULfCDg_1746358249
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C13671956087;
	Sun,  4 May 2025 11:30:48 +0000 (UTC)
Received: from [10.22.80.45] (unknown [10.22.80.45])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 077EB195608D;
	Sun,  4 May 2025 11:30:45 +0000 (UTC)
Date: Sun, 4 May 2025 13:30:42 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, 
    Dan Carpenter <dan.carpenter@linaro.org>
cc: Eric Biggers <ebiggers@kernel.org>, Satya Tangirala <satyat@google.com>, 
    Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
    dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
    kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] dm: add missing unlock on in dm_keyslot_evict()
In-Reply-To: <cad25513-31c4-5895-cfc0-b9c7dce4ce08@redhat.com>
Message-ID: <fbc26327-d14d-f049-d62e-babaab0e9750@redhat.com>
References: <aBHZ4puON8GNK0vw@stanley.mountain> <20250430165037.GA1958@sol.localdomain> <aBJgeV7pZ7Q47OCb@stanley.mountain> <cad25513-31c4-5895-cfc0-b9c7dce4ce08@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17



On Wed, 30 Apr 2025, Mikulas Patocka wrote:

> Ben already tried to fix it in dm_blk_report_zones (see the linux-dm git, 
> for-next branch) - but his fix is incorrect because the "if" condition for 
> dm_get_live_table and dm_put_live_table differs. I'll update his patch to 
> fix this mismatch.
> 
> Mikulas

I fixed it in the Ben's patch "dm: fix dm_blk_report_zones". Ben, please 
review it - it's the patch 37f53a2c60d03743e0eacf7a0c01c279776fef4e in the 
linux-dm repository, for-next branch.

Mikulas

