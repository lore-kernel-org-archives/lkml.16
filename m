Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E843AA9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743388389; cv=none; b=DP/Wu8Z3qh9mg86BRK8ZAGUm/iExO+ZVCRtoHnXHwYbnrX70+uDrulCkdA0TeYjtgr2ylJ9QcKIu2bvYCo8r2YL6U7RfwTXwV2IVx66yrnnqXKEYlF4lnUqOZMWaS3NNTSKnsJTFdavC8zGG67oXK44LvhKckAyjFW46o4i9vEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743388389; c=relaxed/simple;
	bh=vc+2GXwzzRw3vUY4HwHZbaiSfbQeJw2fQe1bDmYWGec=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=Bk7IhQYYFJcpmSL4xG18NQEj1trYaa62dtRzSMM/vG0thGyagdAuNXT1EoOY4fgPUM0W+0bLErPCUotN7Ao8lb+tfDMRfiFdMXEMEi8BBVlAjWNYLBuZakOqrOMlyhWP3m8TK2AhQAf9XxIgJp3AVu7xeY987sgwYqqOOA5rKKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZQwCX5fkkz8R039;
	Mon, 31 Mar 2025 10:32:56 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 52V2Wt8c039043;
	Mon, 31 Mar 2025 10:32:56 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 10:32:57 +0800 (CST)
Date: Mon, 31 Mar 2025 10:32:57 +0800 (CST)
X-Zmail-TransId: 2afa67e9fed92ca-91c3e
X-Mailer: Zmail v1.0
Message-ID: <20250331103257372kkrgDrRRskdABmXRnmbID@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <krzk@kernel.org>, <vkoul@kernel.org>
Cc: <kishon@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gcGh5L2FsbHdpbm5lcjogcGh5LXN1bjUwaS11c2IzOiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 52V2Wt8c039043
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E9FED8.002/4ZQwCX5fkkz8R039

>On 28/03/2025 10:02, shao.mingyin@zte.com.cn wrote:
>> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>> 
>> Replace the open-code with dev_err_probe() to simplify the code.
>> 
>> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
>> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
>
>Why are you sending patch-by-patch? Organize your work for the same
>subsystem into one patchset so we see entire picture at once, not spread
>onto 10 separate threads.
>
>Best regards,
>Krzysztof

Dear Krzysztof,
Thank you for the constructive feedback.
We apologize for any inconvenience caused.We will regroup the patches 
targeting the same subsystem into a consolidated series.

Best regards,
Shao Mingyin
