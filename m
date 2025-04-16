Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9CB2153C2;
	Wed, 16 Apr 2025 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823501; cv=none; b=l+sc3CkYcvyL0WZL6DHPBHYeMkbNl06cepDU5MNYYS3RysvSvki8y3KPnptJcR9v7OSWXebWKtkMg44NQg7H1A3ODvojp5NarMU2ZC/v0UB/cqp5WeI8pGniG7YYKAwa3CeiNWIn43eubNS5rwSE7iJ4BE90k7xnYC7vsWG/bf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823501; c=relaxed/simple;
	bh=IKNEki9zp/WCUxxNJju9SqFwKKz5byOmffJ5uuToh5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rbN15EU7nZvDW9AjwuZcn2KGFWYUldaMb/5Jq+br/s2O3uFrWNaaXo1/TvvQ7fjx7tGuFNxX5rekD3ueS9sDOKd5iP8JvqER6IpB0ubeGxV9a/gKKK21Q3q9ChO+IC03xIZyv51x7OgeRjHKMKizAWMSCRYH3qfpsiLq4LWL2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sauq0O+/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sauq0O+/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9nBQM000921;
	Wed, 16 Apr 2025 17:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKNEki9zp/WCUxxNJju9SqFwKKz5byOmffJ5uuToh5A=; b=Sauq0O+/HGtSHTDM
	njrK+f118UV1RXAE40GVxwqmtUzqpMZlRpryCx3Wj7F1qP5e3guR/R6mguuFspRa
	izCVeG1bp3T22V7o7EHY55YgPwJqlxDF8OlUkApZ9fquOaZPq78O4u1FAQ3rQvLv
	lFvB7Byee73opDvJRk6YwnSduBx0mOAPTaljJxVq5mplSWs1c+JrdmbssyxUeCOw
	MbdCzrep39l1q4axIdCnIhi87W9DKiEoRAoWhwabl8ZtIfVbHQhmo3RStiECo4he
	Vfl75oTzJQn8BwZ5CFqwtPYmmGoQtyCnm85x2JP+1+9ouIi6OXlSF4G8XfMmV2gn
	siPT1w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vmcna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 17:11:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GHBXWr013416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 17:11:33 GMT
Received: from [10.111.181.123] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 10:11:33 -0700
Message-ID: <099574a2-57fa-4af9-ac69-1f0491d6d537@quicinc.com>
Date: Wed, 16 Apr 2025 10:11:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [greybus-dev] Re: [FIRST-PATCH] staging : greybus :
 gb-beagleplay.c : fixing the checks as first-patch
To: rujra <braker.noob.kernel@gmail.com>, Johan Hovold <johan@kernel.org>
CC: <ayushdevel1325@gmail.com>, <elder@kernel.org>,
        <greybus-dev@lists.linaro.org>, <outreachy@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
 <Z_-11fvQJtiwAxaA@hovoldconsulting.com>
 <CAG+54DbMYHDRMs+P1GcSYdqKJn+EBNA2xxXZfeWCX4DK+b31+g@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAG+54DbMYHDRMs+P1GcSYdqKJn+EBNA2xxXZfeWCX4DK+b31+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NaMQMeVBoZO36oI9ntyxpQ-inSXXpgwR
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67ffe4c6 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=CkD-jhSx761AJe65YqkA:9 a=QEXdDO2ut3YA:10
 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10
X-Proofpoint-GUID: NaMQMeVBoZO36oI9ntyxpQ-inSXXpgwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160140

On 4/16/2025 7:00 AM, rujra wrote:
> hi team,
> I have acknowledge the feedback and sure will try to change the file inside
> drivers/staging directory.
> thanking you,
> regards,
> rujra bhatt

There is a lot to learn!

Part of the learning is guidance on responding to review comments.
Please read:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

/jeff

