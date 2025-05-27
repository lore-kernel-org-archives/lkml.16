Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2306927F754
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364187; cv=none; b=ilm5SjxXtzWgovJErQSjPIeB/0GIJO4+MJSVEjFNBwGgfIXfgpYgsVvu/Z+aoDLKfhCr+cuB3zKILzpPU2e8lkS34+71jqD/La0Y5zK4rOCp/NNblqo5rHWNnl43NwFrch8uanl6vxynLcIfaIDFO+fVygGlQ6bzybLNkAmjvXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364187; c=relaxed/simple;
	bh=ku/v7ji6DT3u6PEKUyFFkZRVwekFEnBZYNw8htFk6Ks=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=S5ZXlba5XLjVmwrMpiCB9FaeRFcSj7n3MP372ScX46xnr3+9aggmU8kfNpnGHi8BuwL7nlh849f2Sjsh9QmO5ma+crW3ONCUk6wxaJ0MG/Q092RJc+8jUHuKE341MD5mKfb3Dhp/5E6TK5gF3vNfAq61qUn3aN2XcIg/Sg8wnBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com; spf=pass smtp.mailfrom=kuruczgy.com; dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b=jCPrRhHs; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kuruczgy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuruczgy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kuruczgy.com header.i=@kuruczgy.com header.b="jCPrRhHs"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuruczgy.com;
	s=default; t=1748364170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ku/v7ji6DT3u6PEKUyFFkZRVwekFEnBZYNw8htFk6Ks=;
	b=jCPrRhHsmM+bdPCaHZ4TMonT810h3vyJwzZx9QatnZzIqXa3eyerbghb7Z6Uab7rl/AgoJ
	SlCsFYRL0THSaorzI5ELgK3TuOOqmqxkYBa9LxyrxMa+8kWBDKyEPis9NR806Syi83nR7k
	saVh8NSj/CZDQMMuAcls44Fx6I8leVU=
Date: Tue, 27 May 2025 16:42:46 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: me@kuruczgy.com
Message-ID: <a6ed79b329492648a496353db1462e7a7a09597b@kuruczgy.com>
TLS-Required: No
Subject: Re: [PATCH 5/5] power: supply: qcom-battmgr: Add charge control
 support
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>, "Sebastian Reichel"
 <sre@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>
Cc: "Subbaraman Narayanamurthy" <subbaraman.narayanamurthy@oss.qualcomm.com>,
 "David Collins" <david.collins@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com
In-Reply-To: <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
References: <20250523-qcom_battmgr_update-v1-0-2bb6d4e0a56e@oss.qualcomm.com>
 <20250523-qcom_battmgr_update-v1-5-2bb6d4e0a56e@oss.qualcomm.com>
 <db0e40b6-22f3-46aa-b35d-7a8729370ddf@kuruczgy.com>
 <1b1c4617-0e5b-40c8-9a66-d243b48c0977@oss.qualcomm.com>
X-Migadu-Flow: FLOW_OUT

> No, sc8280xp and x1e80100 don't support it. So I didn't add the support=
 for them.

Hm... From what I heard charge limiting works on some X1E laptops, e.g. t=
he ThinkPad T14s on Windows using Lenovo Vantage.

Do you happen to know how that works? Is that some vendor specific soluti=
on? Or does it depend on the version of the battery management firmware? =
(AFAIK this is part of the adsp firmware?)

Thanks,
Gy=C3=B6rgy
