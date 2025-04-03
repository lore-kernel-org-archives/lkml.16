Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D08F1F4CBA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676060; cv=none; b=ct+yUh/SH1BjG9u8Z0Hb5gLN1/xtVj2LIL8SjNiccxDL2J4OHRQc7+7uWBJcBi6J/7y4xFd6jGDn180ECv1PXDSXibB5ZVR/oNT/DFxyxPN2WOzBsNlbW8sfcJilrSynXRe04ZevJiZ32jr0sKKbmT4tBk7u0KlcqgaqOg2GMqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676060; c=relaxed/simple;
	bh=lfwVHORdgzuE5cR3m8MREy4ZtdC/BhvRf5obzX434w4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDtQD7sw6WE+iuV4vV5cFchJituUM0EepVHHivIogWEmwW6CLcTqCdhyAlgVPiDGVKZfcp0hEdrGSUB6lg7trdanQAPtPK1Kz62tnsITBFgU8h9nCxwx3OaGhcMIOpA/gY/m3Yp29qP7k3y/RRcdxktjcsh9rPgOFhnKlkueWtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZSyWZ3N0Wz6M4dv;
	Thu,  3 Apr 2025 18:23:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9EEBF1404F5;
	Thu,  3 Apr 2025 18:27:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 3 Apr
 2025 12:27:34 +0200
Date: Thu, 3 Apr 2025 11:27:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Shannon Nelson <shannon.nelson@amd.com>
CC: <jgg@nvidia.com>, <dave.jiang@intel.com>, <saeedm@nvidia.com>,
	<leonro@nvidia.com>, <brett.creeley@amd.com>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH fwctl] pds_fwctl: fix type and endian complaints
Message-ID: <20250403112732.000020fd@huawei.com>
In-Reply-To: <20250402165630.24288-1-shannon.nelson@amd.com>
References: <20250402165630.24288-1-shannon.nelson@amd.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Wed, 2 Apr 2025 09:56:30 -0700
Shannon Nelson <shannon.nelson@amd.com> wrote:

> Fix a number of type and endian complaints from the sparse checker.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
