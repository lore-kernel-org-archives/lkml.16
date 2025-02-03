Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763DB1E0DB3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579698; cv=none; b=kzHOkZDuuAJ2mShgI8H8y1C4ct6AcUwqMetG8eAdk7kXJWGl9X1sHImEBWKgbAFxjJC0F7pJkHu390zQqoXxTLrEiGRhOqwDbWh9EVXhrDHOAuD5SePwlB1eUEMxNuTuRGm2wPeQgfpQgmxtGb3foJYqi8OyjDZNPS6sJWUHhdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579698; c=relaxed/simple;
	bh=rWhqo7cWXmDaDOxPmSGtMMFh1rZMXRwWbQYw7ySRD3o=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJqmaanBwy/y2tSI9fEJeb9cHB18/XOLrKN7RVjXJ/o1PuHlKvfyhTJ+Nd0GICOMlJl6UHGnkguAcTLZgX7lzsK++HZdYJENlE9FZAXRPD19wjVL/ENR15BM/xZieRrkSmEJRKkCg5pKHF3gs6iPi7t9YkARlv8RK+wExyIcJOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ymjnx1zTjz6L4yY;
	Mon,  3 Feb 2025 18:45:41 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id EEA59140C72;
	Mon,  3 Feb 2025 18:48:12 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 11:48:12 +0100
Date: Mon, 3 Feb 2025 10:48:10 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/14] acpi/ghes: only set hw_error_le or
 hest_addr_le
Message-ID: <20250203104810.00002200@huawei.com>
In-Reply-To: <7fbe05cb97c50addb61920c68e1aa5027a64610c.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<7fbe05cb97c50addb61920c68e1aa5027a64610c.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 31 Jan 2025 18:42:47 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The hw_error_le pointer is used for legacy support (virt-9.2).
> Starting from virt-10.0, HEST table is accessed via hest_addr_le.
> 
> Remove fw_cfg logic for legacy support if virt is 10.0 or upper.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
