Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DF715CD46
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743613881; cv=none; b=ppGxdTasqCmSa8krtCLvHKX8xPoqVn2Xwv7SM4L+1iHx/BUszQ/UAJ+bpy2xEzeaVBTHvU4Y8w5xKjO/ln/N/kQKm/2rqKjY58Ij6gUkLN1I2AGLQaC2V613ADPDyR3JqmtY4Dd2mPFZCtEgAeCGPPluMLNJ050zG8hvqHhq50A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743613881; c=relaxed/simple;
	bh=+wJNA6oLLunSeEPuZaI+eRVSIe5qi71OKIi76K84Xb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LLUkEFncTgbyYvfPdno46yj7VQTSNCyjpq9yAzYO3CwS0SLOe10zZt3I4MUrQXOTlpT2r5kAVQ68bcLPxrLnEQBihOE0ZrQNJbiyiVFcfIy2dEzpKRlM+2D5UbrQsAvJcFEtRURhxlk3UMyY3iVYI7HdLjT+NWGUCuqoi9rdK6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4OSZv57; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4OSZv57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743613878; x=1775149878;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=+wJNA6oLLunSeEPuZaI+eRVSIe5qi71OKIi76K84Xb0=;
  b=Z4OSZv57xtZy1JdopHf/UCBwegrHUU25RR4IRf2jMywnkS1Q+3x+BWdq
   pdiE3P9jJFkMbVhgFnzC9HXbAfnynAcLX+y/9iKSYw4mtDUZIzZdqqWWg
   fUX9jagwz1Nd73mmw48eCBOiC+dJYPGdZEe0uZsb0SqYx4JLp036rhK+x
   oKYjUO77tcATxif70uYLGGVvlmSkgBl+eh2Mq37wVEH7VV9dxG1ldkEMo
   9fO4Xts3A/9hnR7YP3qwXxdRgMF9R6MAHrizOoS7a4PXo/D1OPvCgYq02
   KnqHFNPdbhjLIQMqh8QjagYUm6ngUJRTFpkf0B8Kk44qOjygp+cEvm0rC
   g==;
X-CSE-ConnectionGUID: buy0o/xnQ6Gb+oAeRUUPQQ==
X-CSE-MsgGUID: yJgaH78wSEm29zBLbSdBpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55658607"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="55658607"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 10:11:17 -0700
X-CSE-ConnectionGUID: Pv6p3CwCQd28FbptNbWIPA==
X-CSE-MsgGUID: ZEd2JhQTRHW+zf79yvqNDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="157755129"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.125.110.4]) ([10.125.110.4])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 10:11:17 -0700
Message-ID: <47d36f29-6507-43bd-b39f-f19a4170551a@intel.com>
Date: Wed, 2 Apr 2025 10:11:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH fwctl] pds_fwctl: fix type and endian complaints
To: Shannon Nelson <shannon.nelson@amd.com>, jgg@nvidia.com,
 saeedm@nvidia.com, Jonathan.Cameron@huawei.com, leonro@nvidia.com,
 brett.creeley@amd.com, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250402165630.24288-1-shannon.nelson@amd.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250402165630.24288-1-shannon.nelson@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/25 9:56 AM, Shannon Nelson wrote:
> Fix a number of type and endian complaints from the sparse checker.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
> ---
>  drivers/fwctl/pds/main.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/fwctl/pds/main.c b/drivers/fwctl/pds/main.c
> index 284c4165fdd4..9b9d1f6b5556 100644
> --- a/drivers/fwctl/pds/main.c
> +++ b/drivers/fwctl/pds/main.c
> @@ -105,12 +105,14 @@ static int pdsfc_identify(struct pdsfc_dev *pdsfc)
>  static void pdsfc_free_endpoints(struct pdsfc_dev *pdsfc)
>  {
>  	struct device *dev = &pdsfc->fwctl.dev;
> +	u32 num_endpoints;
>  	int i;
>  
>  	if (!pdsfc->endpoints)
>  		return;
>  
> -	for (i = 0; pdsfc->endpoint_info && i < pdsfc->endpoints->num_entries; i++)
> +	num_endpoints = le32_to_cpu(pdsfc->endpoints->num_entries);
> +	for (i = 0; pdsfc->endpoint_info && i < num_endpoints; i++)
>  		mutex_destroy(&pdsfc->endpoint_info[i].lock);
>  	vfree(pdsfc->endpoint_info);
>  	pdsfc->endpoint_info = NULL;
> @@ -199,7 +201,7 @@ static int pdsfc_init_endpoints(struct pdsfc_dev *pdsfc)
>  	ep_entry = (struct pds_fwctl_query_data_endpoint *)pdsfc->endpoints->entries;
>  	for (i = 0; i < num_endpoints; i++) {
>  		mutex_init(&pdsfc->endpoint_info[i].lock);
> -		pdsfc->endpoint_info[i].endpoint = ep_entry[i].id;
> +		pdsfc->endpoint_info[i].endpoint = le32_to_cpu(ep_entry[i].id);
>  	}
>  
>  	return 0;
> @@ -214,6 +216,7 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
>  	struct pds_fwctl_query_data *data;
>  	union pds_core_adminq_cmd cmd;
>  	dma_addr_t data_pa;
> +	u32 num_entries;
>  	int err;
>  	int i;
>  
> @@ -246,8 +249,9 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
>  	*pa = data_pa;
>  
>  	entries = (struct pds_fwctl_query_data_operation *)data->entries;
> -	dev_dbg(dev, "num_entries %d\n", data->num_entries);
> -	for (i = 0; i < data->num_entries; i++) {
> +	num_entries = le32_to_cpu(data->num_entries);
> +	dev_dbg(dev, "num_entries %d\n", num_entries);
> +	for (i = 0; i < num_entries; i++) {
>  
>  		/* Translate FW command attribute to fwctl scope */
>  		switch (entries[i].scope) {
> @@ -267,7 +271,7 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
>  			break;
>  		}
>  		dev_dbg(dev, "endpoint %d operation: id %x scope %d\n",
> -			ep, entries[i].id, entries[i].scope);
> +			ep, le32_to_cpu(entries[i].id), entries[i].scope);
>  	}
>  
>  	return data;
> @@ -280,24 +284,26 @@ static int pdsfc_validate_rpc(struct pdsfc_dev *pdsfc,
>  	struct pds_fwctl_query_data_operation *op_entry;
>  	struct pdsfc_rpc_endpoint_info *ep_info = NULL;
>  	struct device *dev = &pdsfc->fwctl.dev;
> +	u32 num_entries;
>  	int i;
>  
>  	/* validate rpc in_len & out_len based
>  	 * on ident.max_req_sz & max_resp_sz
>  	 */
> -	if (rpc->in.len > pdsfc->ident.max_req_sz) {
> +	if (rpc->in.len > le32_to_cpu(pdsfc->ident.max_req_sz)) {
>  		dev_dbg(dev, "Invalid request size %u, max %u\n",
> -			rpc->in.len, pdsfc->ident.max_req_sz);
> +			rpc->in.len, le32_to_cpu(pdsfc->ident.max_req_sz));

Maybe use a local var for max_req_sz. I'm seeing that getting converted more than once in the same function.

>  		return -EINVAL;
>  	}
>  
> -	if (rpc->out.len > pdsfc->ident.max_resp_sz) {
> +	if (rpc->out.len > le32_to_cpu(pdsfc->ident.max_resp_sz)) {
>  		dev_dbg(dev, "Invalid response size %u, max %u\n",
> -			rpc->out.len, pdsfc->ident.max_resp_sz);
> +			rpc->out.len, le32_to_cpu(pdsfc->ident.max_resp_sz));

Same for max_res_sz.

DJ

>  		return -EINVAL;
>  	}
>  
> -	for (i = 0; i < pdsfc->endpoints->num_entries; i++) {
> +	num_entries = le32_to_cpu(pdsfc->endpoints->num_entries);
> +	for (i = 0; i < num_entries; i++) {
>  		if (pdsfc->endpoint_info[i].endpoint == rpc->in.ep) {
>  			ep_info = &pdsfc->endpoint_info[i];
>  			break;
> @@ -326,8 +332,9 @@ static int pdsfc_validate_rpc(struct pdsfc_dev *pdsfc,
>  
>  	/* reject unsupported and/or out of scope commands */
>  	op_entry = (struct pds_fwctl_query_data_operation *)ep_info->operations->entries;
> -	for (i = 0; i < ep_info->operations->num_entries; i++) {
> -		if (PDS_FWCTL_RPC_OPCODE_CMP(rpc->in.op, op_entry[i].id)) {
> +	num_entries = le32_to_cpu(ep_info->operations->num_entries);
> +	for (i = 0; i < num_entries; i++) {
> +		if (PDS_FWCTL_RPC_OPCODE_CMP(rpc->in.op, le32_to_cpu(op_entry[i].id))) {
>  			if (scope < op_entry[i].scope)
>  				return -EPERM;
>  			return 0;
> @@ -402,7 +409,7 @@ static void *pdsfc_fw_rpc(struct fwctl_uctx *uctx, enum fwctl_rpc_scope scope,
>  	cmd = (union pds_core_adminq_cmd) {
>  		.fwctl_rpc = {
>  			.opcode = PDS_FWCTL_CMD_RPC,
> -			.flags = PDS_FWCTL_RPC_IND_REQ | PDS_FWCTL_RPC_IND_RESP,
> +			.flags = cpu_to_le16(PDS_FWCTL_RPC_IND_REQ | PDS_FWCTL_RPC_IND_RESP),
>  			.ep = cpu_to_le32(rpc->in.ep),
>  			.op = cpu_to_le32(rpc->in.op),
>  			.req_pa = cpu_to_le64(in_payload_dma_addr),

