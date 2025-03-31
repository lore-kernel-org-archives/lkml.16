Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655941B6CE3;
	Mon, 31 Mar 2025 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743405606; cv=none; b=gwkktnMXQT46nFEZTQIVYtzeOfhxDLhGMoQRQNOYu2zP8ALsF1s+PBdkNF9tPnCXNNrQyZubiBZeA+iWbj0N357JCNFMBddxostRt8bgk1Q8pvwbt6UzW/e4X53MvgmKcBloFJ4Ilj2AhYV41cvZp8ibo7v3AjVivchsD+EKwz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743405606; c=relaxed/simple;
	bh=UTqJO7b/EnZPMj44DRFz/sH3r70AVvKKCl0oERDr37k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGvCKZvPoLoDN9XS9shXJ1CJUhP1XWc0cTkIvqneVyGwqjhUE/QoxwZLxyD6zgf2+rTaea466Q0MYNFh5HiDE76c69MTmUP8Jv6WMc1lqMwDLc+vjCLW7IWlUCrfCmeqarKziE709bmOTXr3Z3wZGPa0iRqBRBqWEajb33RnGow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oSSbzYb3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oSSbzYb3"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UKdrT3014553;
	Mon, 31 Mar 2025 07:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=TrvU5gxl61CPKW00bfzGYGxhF3mkLV
	HsW/CK3OIi1is=; b=oSSbzYb3lJ6SJQU2T+0C3sa35MEZxgglYjVPa9oVLqe7Zf
	cy9udUXNw0AYoZ9am2hB+IkRbmD3DNDy/k0Kh59AEMvetkYWIODWq21Ie/8iKBKB
	ox9Emr+9f7+JUkXKGjPPVA9A7iW+pTMmwlX3fnR8vo6UdV/l9Aw+Sl5DAuhdr6Ti
	neMo1ZrT35faEiMsbPvjXpLLKYQ9Dz2PXrbcGZjcBmhvdhJQ2+1ykc+v533QUpkA
	u9kxR34IJFq2oa0FJHfELq9mKIXMRTZfKhq5Sar0XMpZf1E99xKGyFFHWzTJuba8
	LnBW41n5OKlrO5C3XwsP+w99GtFbdDDyIsaQJo4A==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qd601tm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:20:02 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52V3t2KM004757;
	Mon, 31 Mar 2025 07:20:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45pujymy21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 07:20:01 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52V7Jxbq32834194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 07:19:59 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B84920049;
	Mon, 31 Mar 2025 07:19:59 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21D6020040;
	Mon, 31 Mar 2025 07:19:59 +0000 (GMT)
Received: from li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com (unknown [9.179.15.102])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 31 Mar 2025 07:19:59 +0000 (GMT)
Date: Mon, 31 Mar 2025 09:19:57 +0200
From: Sumanth Korikkar <sumanthk@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: s390-linux-ld: Error: unable to disambiguate: -no-pie (did you
 mean --no-pie ?)
Message-ID: <Z-pCHdB0uXDUCki0@li-2b55cdcc-350b-11b2-a85c-a78bff51fc11.ibm.com>
References: <202503291141.yTqSRdTX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503291141.yTqSRdTX-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9zvbuRIULWZjvjT11wx3x6FZwv7k-u9Q
X-Proofpoint-GUID: 9zvbuRIULWZjvjT11wx3x6FZwv7k-u9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=881 impostorscore=0
 clxscore=1011 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310048

On Sat, Mar 29, 2025 at 11:11:17AM +0800, kernel test robot wrote:
> Hi Sumanth,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0c86b42439b6c11d758b3392a21117934fef00c1
> commit: 00cda11d3b2ea07295490b7d67942014f1cbc5c1 s390: Compile kernel with -fPIC and link with -no-pie
> date:   11 months ago
> config: s390-randconfig-001-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291141.yTqSRdTX-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291141.yTqSRdTX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503291141.yTqSRdTX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> s390-linux-ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)

Thanks for reporting.

I have worked on it. The fix should be available in the very near future.

Best Regards,
Sumanth
