Received: from pv50p00im-zteg10021401.me.com (pv50p00im-zteg10021401.me.com [17.58.6.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D655E250C12
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285876; cv=none; b=W3S964mmOLSDIFYQLeYaBCOcjgI+ZuL/t6TJ82BZWMaih+jMgdXiNUIcdA1w8lYrSRIm29qxcwmDEzRTOpyGZrMfEQMVoTp/fJcrgQ3atvhcbTpjNBxZrFobn+bOntJqNWuJ7pZNViqfiqoEYWwmtDjbkkwqClqw7aLSQh5YLdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285876; c=relaxed/simple;
	bh=jJhDdi5vyJ+dttGz+jZyFiklBfZmzXnJOFb3d6Dslv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZ622h0AVvrwbjzBTJnmBy7JBffTii7hpSUndsJ+iInWOff4G/UCn+QCJCiadL9wxexQjqnyh/viuwSsQ2ExOvhb28NUfBayw7l2P4MEVqSEowGVDXO/H5AcMIQDWeJG1xupw2/yPqvtKIh/ZE0hZiD8TomgE6/qIGpGvoty2F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=HSkMhZ5U; arc=none smtp.client-ip=17.58.6.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="HSkMhZ5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=s/1ZG6K3ujgwawbT+0LJKPg8veE+ifA+dNUdHk5f8qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=HSkMhZ5U08B1Q9zdlsoy9tJA4eEeB7cTbXrTpN0Qe/CFNbOznJM+tw6N+vm63L78w
	 CNug0iBSXdrdrqJ49ce2CeUtaYqH01Bgkf0uvtFcu9fTARtVdV8qqzgHFd92z1sapf
	 vzCsDP/9FLHWkNMkLzztyLuJXMlrK3vl+wDZiES1o+RJtpjK5haRKk889sR8Jp9qb8
	 /CgGMGg9f9kyqDmV5RWXYtJ+9F6WUtizbKp7PE3ghbRQu6MCfnuWWpl5d4xq956+CU
	 pIBAqhi35pkvUozY59Mn1UfeLJYrv88q+CcU0wqt1cU+MyUFEIQALz+LWh3qwi0swC
	 4MSeEF/DHvFPg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10021401.me.com (Postfix) with ESMTPSA id 176518E0648;
	Tue, 11 Feb 2025 14:57:47 +0000 (UTC)
Message-ID: <82cdb70d-475f-440e-8550-3c52b4e000fa@icloud.com>
Date: Tue, 11 Feb 2025 22:57:43 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] of: property: Increase NR_FWNODE_REFERENCE_ARGS
To: Rob Herring <robh@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Len Brown <lenb@kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
References: <20250210-fix_arg_count-v3-1-a084a5013008@quicinc.com>
 <Z6oclML_DC1Vnf6z@smile.fi.intel.com>
 <73eb84f3-8b9d-41f4-9b59-d059111a3d03@icloud.com>
 <Z6tBlfmTFu9916LA@smile.fi.intel.com>
 <a682824a-1b65-4b05-9e42-3edc167600a8@icloud.com>
 <CAL_JsqJ6wg3Q9FxKOzrnRo_s1ZznLurfsDuWJ+XVQzA5YS6Rsw@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <CAL_JsqJ6wg3Q9FxKOzrnRo_s1ZznLurfsDuWJ+XVQzA5YS6Rsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cv_QiGh7JK4nazlJgp9KcnmxzBxWSmb4
X-Proofpoint-ORIG-GUID: cv_QiGh7JK4nazlJgp9KcnmxzBxWSmb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502110100

On 2025/2/11 22:22, Rob Herring wrote:
>> i have confirmed that:
>>
>> of.h includes fwnode.h indirectly
>> fwnode.h does not include of.h directly or indirectly
> Only for struct fwnode_handle. I don't think we want to add to that.
> For the most part, fwnode is a layer above DT and the DT code should
> know nothing about fwnode.

DT, as a type of firmware node, needs to implement firmware node
interfaces 'struct fwnode_operations' defined in fwnode.h.

so it includes fwnode.h and knows everything of fwnode.h

A)
diff --git a/include/linux/of.h b/include/linux/of.h
#define MAX_PHANDLE_ARGS 16
 struct of_phandle_args {
        struct device_node *np;
        int args_count;
        uint32_t args[MAX_PHANDLE_ARGS];
 };
+static_assert(NR_FWNODE_REFERENCE_ARGS == MAX_PHANDLE_ARGS);

B)
diff --git a/include/linux/of.h b/include/linux/of.h
-#define MAX_PHANDLE_ARGS 16
+#define MAX_PHANDLE_ARGS NR_FWNODE_REFERENCE_ARGS

you like solution A), right ?
