Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7772079CD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.251.27.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749009233; cv=none; b=I4cRBjEVsrWxCjr4LpdR9H8HJxuh78kE2eN1uTVMBz6fRx/SmlGf/iQByS7iRxDoIgQuLMlGPBJB3MWznd0OXtZYo5HnRKpRXXqrdF0ewq3TtfoFcp5g47SLHt/XAEyZgSNmuGiXxUXVgNJ0UByFis2kJLVmQGB+hkA8izKtDE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749009233; c=relaxed/simple;
	bh=tdS2rHG+ufHcKeUbNdtFyzh5CMAWDSyRXep60d0zdGc=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=W+tIfho99337StGN8lju5dWn0jDDblXVIPXtPm1ON542bUxLXQZ6UJLkpR77nadku1mmyJzDxiMM0/vYv8nox1HeosbXZKHW8RKEC/tJujX2UmPhtXh9KQhVMjBOE8yHTAzkRtsPNgP7DNFIn+PCOhCyMOB7/dyziuuT7eXXNpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=58.251.27.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bBtl95MjQz3bkR
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:45:25 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4bBtl26KT5z5TCG0
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:45:18 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bBtkr0j4hz8RVF6;
	Wed,  4 Jun 2025 11:45:08 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 5543j0WP086912;
	Wed, 4 Jun 2025 11:45:00 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 4 Jun 2025 11:45:01 +0800 (CST)
Date: Wed, 4 Jun 2025 11:45:01 +0800 (CST)
X-Zmail-TransId: 2afb683fc13d277-84121
X-Mailer: Zmail v1.0
Message-ID: <20250604114501931NW2by8F85vCd24yqRYHAx@zte.com.cn>
In-Reply-To: <20250604031758.4150209-2-xialonglong@kylinos.cn>
References: 20250604031758.4150209-1-xialonglong@kylinos.cn,20250604031758.4150209-2-xialonglong@kylinos.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <xialonglong@kylinos.cn>
Cc: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <xialonglong@kylinos.cn>,
        <yang.yang29@zte.com.cn>, <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzJdIG1tL2tzbTogY2FsY3VsYXRlIGtzbV9wcm9jZXNzX3Byb2ZpdCBtb3JlIGFjY3VyYXRlbHk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 5543j0WP086912
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 683FC154.001 by FangMail milter!
X-FangMail-Envelope: 1749008725/4bBtl95MjQz3bkR/683FC154.001/10.35.20.165/[10.35.20.165]/mxde.zte.com.cn/<xu.xin16@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 683FC154.001/4bBtl95MjQz3bkR

> The general_profit_show() only considers ksm_pages_sharing,
> whereas ksm_process_profit() accounts for both ksm_pages_sharing
> and ksm_pages_shared for each process. This discrepancy leads to
> the sum of ksm_process_profit() across all processes not being equal
> to general_profit_show().
> 
> Fixes: 7609385337a4 ("ksm: count ksm merging pages for each process")
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
> ---
>  mm/ksm.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)

Thanks for you report, but we'd better not change the definition of ksm_merging_pages which means
all pages involved in ksm merging (pages_sharing + pages_shared), and Do not rename the existing
of interface, which breaks user-space tools.

If we reallt want a more pricise profit of a process , I suggest:
 -  1) Add a variable 'ksm_pages_sharing'  in mm_struct for processes.
 -  2) Refine the implementation of ksm_process_profit().

Thanks~

> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 8583fb91ef13..fa4e1618b671 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -824,12 +824,10 @@ static void remove_node_from_stable_tree(struct ksm_stable_node *stable_node)
>  	hlist_for_each_entry(rmap_item, &stable_node->hlist, hlist) {
>  		if (rmap_item->hlist.next) {
>  			ksm_pages_sharing--;
> +			rmap_item->mm->ksm_merging_pages--;
>  			trace_ksm_remove_rmap_item(stable_node->kpfn, rmap_item, rmap_item->mm);
> -		} else {
> +		} else
>  			ksm_pages_shared--;
> -		}
> -
> -		rmap_item->mm->ksm_merging_pages--;
