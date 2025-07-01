Received: from techbitestudio.com (techbitestudio.com [75.119.147.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220132749D9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=75.119.147.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379620; cv=none; b=QEqupKyN/hOah+d4Ds/bMLRn+Rum69ZKg1cWUx8bwZV83+Yp+86M9ElHpm6RxlDdcckP8miH5UEog/CoMPPQJTKsZUGMKMStpTs7kmI097AGufakhoAmcm/QcgQzOX1uI5TZOk44dNVmJ8CuAP6qeQpDFxWO/MxHPRfytU7kiDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379620; c=relaxed/simple;
	bh=XibHfJH1twxA/lZ+LIJ/+4l8tRGcnieX+HQdfGfR9E8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=pIybjg1Fl2goIxNm8rV01p435q9pa4p88EqVx0tRu0OIg4t1Q4Tt9RFH90jEvd8ljzd+xid8wgxjoFgiX+XFeihxevJ2dlKpqnV4e3KDzTumqin88USBRKrKfQc5jjcbk0juGOL4ZduSPV7W4rOYOl8r19fefw7MIK8X59t+nI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in; spf=pass smtp.mailfrom=kenip.in; dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b=fYy6bCmJ; arc=none smtp.client-ip=75.119.147.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kenip.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenip.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kenip.in header.i=@kenip.in header.b="fYy6bCmJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kenip.in;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=elKhknzm0tmwmPdkWLM7QpzR6olWXS5LVsxGr4H32WI=; b=fYy6bCmJaKlMpsK6qgLmyslOly
	5GSxKRNCOeIr0NuKbaq+bn1DRUofgZaNtPAjrHS6xsZtaUaRTrsWOP7bb1sbALech84zBuwoEtWPd
	OizMDh0mPjHgyut8dewjWBbWeAE2azX2/spHYdoc62Zba9a7fVCfMiekDfhaFSrkOLtc=;
Received: from localhost ([127.0.0.1] helo=kenip.in)
	by techbitestudio.com with esmtpa (Exim 4.93)
	(envelope-from <siddhartha@kenip.in>)
	id 1uWbqE-0006Jn-OL; Tue, 01 Jul 2025 19:50:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 19:50:10 +0530
From: siddhartha@kenip.in
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mgorman@suse.de
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_?=
 =?UTF-8?Q?performance_gain_observed_in_AI_inference_workloads?=
In-Reply-To: <04a109b1-8f60-45e3-b8d3-70bd849ee877@lucifer.local>
References: <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
 <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com>
 <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com>
 <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com>
 <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
 <5c3d307f-d303-48c3-b730-99a83d4815ec@lucifer.local>
 <dd370f92e9100e785aeafdc4d31f8cb5@kenip.in>
 <04a109b1-8f60-45e3-b8d3-70bd849ee877@lucifer.local>
Message-ID: <9d87a2f8592cdf517e7d501564f42201@kenip.in>
X-Sender: siddhartha@kenip.in
X-Priority: 1 (Highest)
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-01 18:58, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 06:53:47PM +0530, siddhartha@kenip.in wrote:
>> Hi Lorenzo,
>> 
>> Thanks for your clarification, and I appreciate your patience — 
>> especially
>> given your role in maintaining and designing the VMA merge logic.
>> 
>> I understand now that my earlier phrasing may have repeated your 
>> explanation
>> for VMA adjacency, and I regret unintentionally restating it.
>> 
>> I’ll make sure to be more careful and direct going forward.
> 
> Thanks, no problem. Mostly avoids confusion.
> 
>> 
>> As for the THP alignment condition now being `IS_ALIGNED(len, 
>> PMD_SIZE)`, I
>> agree this resolves the regressions by removing alignment for 
>> non-aligned
>> sizes, which was exactly what broke workloads like cactusBSSN or some 
>> AI
>> inference loads.
> 
> Ack - we're really happy to hear about workloads that this has helped 
> as this
> kind of input is very important as to getting insight into how 
> THP-related stuff
> impacts real users so we can best optimise especially for workloads 
> that are
> very important in the industry right now.
> 
>> 
>> Thanks again for the guidance — I’m learning a lot from this thread.
> 
> Glad to have helped, thanks again for reporting!
> 
>> 
>> Best Regards,
>> Siddhartha Sharma
>> 
> 
> Cheers, Lorenzo

Hi Lorenzo,

Thanks for the acknowledgement of my work, I really appreciate it. 
Please let me know if there is anything I can do here now moving 
forwards with integrating. Furthermore, once integrated and tested, I 
would like to see all performance metrics that have seen improvements if 
possible.

Best Regards,
Siddhartha Sharma
