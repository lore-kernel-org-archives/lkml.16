Received: from outbound.pv.icloud.com (p-west1-cluster2-host8-snip4-7.eps.apple.com [57.103.64.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C0C1F09AD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747263234; cv=none; b=gxS5luox6HnwOF2HOLCO7JC2gCufXc6uEd5rN4Sg3kCSTxO/kSf5/8T420SzoRrOxLVsaC5nxj2RCKl/IXC8vrKsp0u4sN+gVluzUaUic7AJGOEefbXwSziPturFIlOsK7ovbrGdCe2mzW4iMYTXhpAHuFyrDn0eWidwkEdSAcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747263234; c=relaxed/simple;
	bh=uIcpjGas2M08Id7X2Ne/0EUZc6DuXYU8zcB9lciva48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUzfYbdgjwFmnxKJSPipo8/vGwcSyoxNi32xK01h/WlmnSBtWleZ2/XN9FNi0XPK+JCjkO8vV3I0wJEJnAVWonw43JWASRLClbeLTG24gUxBTwmYKmQNgVkZ4r4C2kuG8X5dTD80bKZEspk3KHwl8tZpqK0JwJ4CqSAPKd6iVto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=ODmiFydf; arc=none smtp.client-ip=57.103.64.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="ODmiFydf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=sJFhDbHe3RQeCqJjlXBiwTVMs1GtvaYq9fWQt6CNbPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=ODmiFydf6raRpLE1epFjZFVOuPSJ58tK3HF/KCJHy4HTEPG5SW3kpskNfIF8u6fv4
	 dvFeXg9TOkMDBZoaXlnHlnE9AwSBFVZ/xaUpsoyFWTBzvP0i8xXl6/dEseKqDi82Rm
	 u1w3AdfUZAbpVAONYde1GqCX3ENK8mKSmS2DcdQEx2LG7uNoMb9P7Ue+osxUDUoL7s
	 jJJ7ZUTITsTsptUhR8psKv9Z/L241nAKcDScl4BDIg2h4t0Jeqm51ESgzwXCfudRkc
	 8q9+R/g0bUFYOkk/OS8Y9xm09sS1a/B2CKSwarizYJwWcZqlatxUe4wkfDaXiefOZR
	 BMB4WiDYCpmeQ==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 956F418009A1;
	Wed, 14 May 2025 22:53:47 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 51A60180026F;
	Wed, 14 May 2025 22:53:44 +0000 (UTC)
Message-ID: <ed2be0f8-afb4-437a-9c72-209da9e30b8a@icloud.com>
Date: Thu, 15 May 2025 06:53:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/2] phy: core: Remove 2 APIs
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Zijun Hu <quic_zijuhu@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20250414-remove-apis-v1-0-6fddc9a5a16d@quicinc.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20250414-remove-apis-v1-0-6fddc9a5a16d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GUr_ctL5GyTiGhdvRmBU_Vnug1th4iYi
X-Proofpoint-GUID: GUr_ctL5GyTiGhdvRmBU_Vnug1th4iYi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=851
 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2503310001 definitions=main-2505140212

On 2025/4/14 19:49, Zijun Hu wrote:
> This patch series is to remove the following 2 APIs:
> 
> devm_of_phy_provider_unregister()
> devm_phy_destroy()
> 
> Both APIs have not had callers for more than 10 years.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
> Zijun Hu (2):
>       phy: core: Remove API devm_of_phy_provider_unregister()
>       phy: core: Remove API devm_phy_destroy()
> 
>  Documentation/driver-api/phy/phy.rst               | 11 ++-----
>  .../translations/zh_CN/driver-api/phy/phy.rst      | 12 ++------
>  drivers/phy/phy-core.c                             | 36 ----------------------
>  include/linux/phy/phy.h                            | 11 -------
>  4 files changed, 6 insertions(+), 64 deletions(-)

Hi Vinod,

Gentle ping you for your awareness since this patch series have pended
for more than 3 months without no response.



