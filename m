Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F82D3233
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750709953; cv=none; b=W2TPBjQss0P/cIIrN29mle96Nh8TIlLIhfIwI9EqPgbUniQBfOX+By6tizhZLzTuZxGK4S6E8BwSBvkTccTmhXK9po23xS8O+tuHYqAN2E6QUZjS3lyT8FvnvcCUQJy10XlmoM5kErTgBEgPC4piNukpGxf50wwKdyhq1XArRR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750709953; c=relaxed/simple;
	bh=/5JH+krDEC24HJ/USSV1gN2JNeytbQ5gnhP7Vps2YWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5TtQ78jsnsZQLnOLidTKE6G7hgHjV31/2rjMY81eq85vFZBxA/aH4kwoYcx/vVOfteP9Jx2x46IZ+UYvh8+lig7ZHk0OIngoDijoo9z+kpSYmTn2fp58Xn4DVJQX+ZUKj0fdRgAdtc0FQxtJeNAg/Wt8TeJ1ra4Gu7jBUNMFvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUttHEOm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUttHEOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750709951; x=1782245951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/5JH+krDEC24HJ/USSV1gN2JNeytbQ5gnhP7Vps2YWs=;
  b=jUttHEOmaNv+KzgqWBTpxQauCiZimSckR/BULuiVlqH9F9WB/q/I2FLT
   9NwJ+FaGdLOwVUmNZHCWWzKNKqHVNWTi3IHcDycykKsweRtIfq6RFik2b
   DrlWkWxtbUfwCvaBe14BcQee1HpwX4X6sA6DTcDFl7Bhe7idCApAww+T6
   f2iLt7t9U8dCVEUT9uifAHPAWBcLVa0AZbW24SMTguIQbe73LQvXO0NvV
   yUKOE6xnjwj+gnNYNWyt+pEYV3CNczkkDKk5W3RM337iLIUyWs9hffxDm
   FQRbXRSuWI9eB4oOLVZodYBt7Y10GrOruMGQr9OnNut5Y7g7B+lrg2b54
   w==;
X-CSE-ConnectionGUID: y+Cw45owTIWfFX22OIdg1A==
X-CSE-MsgGUID: lo2jZ3ukRBGZSFUHmUXKZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56735566"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="56735566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 13:19:10 -0700
X-CSE-ConnectionGUID: sMptsbZZRyGVdjIRr4Ha0g==
X-CSE-MsgGUID: j8mRSHIQQPSaRpnKZNpJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151872263"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jun 2025 13:19:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTndD-000PIW-08;
	Mon, 23 Jun 2025 20:19:07 +0000
Date: Tue, 24 Jun 2025 04:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: net/rxrpc/output.c:974:1: warning: the frame size of 1160 bytes is
 larger than 1024 bytes
Message-ID: <202506240423.E942yKJP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: 5800b1cf3fd8ccab752a101865be1e76dac33142 rxrpc: Allow CHALLENGEs to the passed to the app for a RESPONSE
date:   2 months ago
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250624/202506240423.E942yKJP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240423.E942yKJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240423.E942yKJP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/rxrpc/output.c: In function 'rxrpc_send_response':
>> net/rxrpc/output.c:974:1: warning: the frame size of 1160 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     974 | }
         | ^


vim +974 net/rxrpc/output.c

   919	
   920	/*
   921	 * Send a RESPONSE message.
   922	 */
   923	void rxrpc_send_response(struct rxrpc_connection *conn, struct sk_buff *response)
   924	{
   925		struct rxrpc_skb_priv *sp = rxrpc_skb(response);
   926		struct scatterlist sg[16];
   927		struct bio_vec bvec[16];
   928		struct msghdr msg;
   929		size_t len = sp->resp.len;
   930		__be32 wserial;
   931		u32 serial = 0;
   932		int ret, nr_sg;
   933	
   934		_enter("C=%x,%x", conn->debug_id, sp->resp.challenge_serial);
   935	
   936		sg_init_table(sg, ARRAY_SIZE(sg));
   937		ret = skb_to_sgvec(response, sg, 0, len);
   938		if (ret < 0)
   939			goto fail;
   940		nr_sg = ret;
   941	
   942		for (int i = 0; i < nr_sg; i++)
   943			bvec_set_page(&bvec[i], sg_page(&sg[i]), sg[i].length, sg[i].offset);
   944	
   945		iov_iter_bvec(&msg.msg_iter, WRITE, bvec, nr_sg, len);
   946	
   947		msg.msg_name	= &conn->peer->srx.transport;
   948		msg.msg_namelen	= conn->peer->srx.transport_len;
   949		msg.msg_control	= NULL;
   950		msg.msg_controllen = 0;
   951		msg.msg_flags	= MSG_SPLICE_PAGES;
   952	
   953		serial = rxrpc_get_next_serials(conn, 1);
   954		wserial = htonl(serial);
   955	
   956		ret = skb_store_bits(response, offsetof(struct rxrpc_wire_header, serial),
   957				     &wserial, sizeof(wserial));
   958		if (ret < 0)
   959			goto fail;
   960	
   961		rxrpc_local_dont_fragment(conn->local, false);
   962	
   963		ret = do_udp_sendmsg(conn->local->socket, &msg, len);
   964		if (ret < 0)
   965			goto fail;
   966	
   967		conn->peer->last_tx_at = ktime_get_seconds();
   968		return;
   969	
   970	fail:
   971		trace_rxrpc_tx_fail(conn->debug_id, serial, ret,
   972				    rxrpc_tx_point_response);
   973		kleave(" = %d", ret);
 > 974	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
