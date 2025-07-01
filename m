Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C11FDA69
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751347697; cv=none; b=c5kpD3drVZ7MGy+/v2Mjye02fxetimER5ESuo5pD8lbTU4caRS4ofsLYuUlfSMZ5y8H8AJImKspB4r3YuGblnCmOQPERlkvQQ9coDIIeCu9IdWmV9leeDjr8mi3UJ5hKJYwiGkw2cs/Tnabhud6BGXOIpnTOEmmQhYCfXd9hdhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751347697; c=relaxed/simple;
	bh=FaeFlfFF3MuFTSybP/3bp+qx9BhmSoAlbzbecSuzCfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hvvj3apooEn1KEpAmesuplf6j00zmlMqUyCjMxgworx+D1ZrxLxTjOsyPpysis3qo/lBQIjwqPBbgHuVEAC76PLBsEvXT5SsYxfoCp8O5gM2xsBt2njYPnmBQ8lxWCu9jp8wSAFyWoHvBeAjUXzI8ooMBHroYOlBpgwhXRqj18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Deqed5TL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Deqed5TL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751347696; x=1782883696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FaeFlfFF3MuFTSybP/3bp+qx9BhmSoAlbzbecSuzCfI=;
  b=Deqed5TLIBnUnzLitxbOvP3qiweQPLRLRq/Pno2hNPXPPJhWHLJBC0cf
   4mExiTjnl33oyZTr1c/oryj8DNK+SX2o4zrT9fQ+oWvZQtkH7Z7dFr+Wc
   yCEuYtxiaW0knkWFFG5CcO2NX8JdcOIds2xsdncKhgutymYNKmURUVAJo
   CIa48oV4OhX9vVUTNhkKfeEcxrknhD/pWkuTkpyNTPM4Y+RG4if//OcJY
   /sGejBbHAk009AnQMIuR9lN8YoFkfWx3+xSPYG2rOZGE34gU1S3D86hox
   IdKpGqINv93uEDpiXT7j++jKPlImAscdpO+Q+OZiXPK/cJN0jK9b1ORli
   g==;
X-CSE-ConnectionGUID: 82MtTsOsRxaYtu1Hlc/+Rg==
X-CSE-MsgGUID: SViJkB4ER6qnCpYMiVdiOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="56215703"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="56215703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 22:28:15 -0700
X-CSE-ConnectionGUID: WdCbeWFiR12jvOYCFUic2w==
X-CSE-MsgGUID: t+Ea1Aq7QWG6l0U5gnt24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="157932827"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jun 2025 22:28:13 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWTXN-0001QF-1j;
	Tue, 01 Jul 2025 05:28:09 +0000
Date: Tue, 1 Jul 2025 07:27:42 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250616 2395/2847]
 fs/bcachefs/btree_journal_iter.c:716:6: warning: variable 'nr_entries' set
 but not used
Message-ID: <202507010724.lVYV4UeK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250616
head:   78f053980ba50a0becae798ab7d07527d97e790d
commit: 86f84750a02d65e592ec519e82ae73ad54149e59 [2395/2847] bcachefs: opts.journal_rewind
config: powerpc-randconfig-2002-20250701 (https://download.01.org/0day-ci/archive/20250701/202507010724.lVYV4UeK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010724.lVYV4UeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010724.lVYV4UeK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_journal_iter.c:716:6: warning: variable 'nr_entries' set but not used [-Wunused-but-set-variable]
     716 |         u64 nr_entries = 0;
         |             ^
   1 warning generated.


vim +/nr_entries +716 fs/bcachefs/btree_journal_iter.c

   709	
   710	int bch2_journal_keys_sort(struct bch_fs *c)
   711	{
   712		struct genradix_iter iter;
   713		struct journal_replay *i, **_i;
   714		struct journal_keys *keys = &c->journal_keys;
   715		size_t nr_read = 0;
 > 716		u64 nr_entries = 0;
   717	
   718		u64 rewind_seq = c->opts.journal_rewind ?: U64_MAX;
   719	
   720		genradix_for_each(&c->journal_entries, iter, _i) {
   721			i = *_i;
   722	
   723			nr_entries += i != NULL;
   724	
   725			if (journal_replay_ignore(i))
   726				continue;
   727	
   728			cond_resched();
   729	
   730			vstruct_for_each(&i->j, entry) {
   731				bool rewind = !entry->level &&
   732					!btree_id_is_alloc(entry->btree_id) &&
   733					le64_to_cpu(i->j.seq) >= rewind_seq;
   734	
   735				if (entry->type != (rewind
   736						    ? BCH_JSET_ENTRY_overwrite
   737						    : BCH_JSET_ENTRY_btree_keys))
   738					continue;
   739	
   740				if (!rewind && le64_to_cpu(i->j.seq) < c->journal_replay_seq_start)
   741					continue;
   742	
   743				jset_entry_for_each_key(entry, k) {
   744					struct journal_key n = (struct journal_key) {
   745						.btree_id	= entry->btree_id,
   746						.level		= entry->level,
   747						.rewind		= rewind,
   748						.k		= k,
   749						.journal_seq	= le64_to_cpu(i->j.seq),
   750						.journal_offset	= k->_data - i->j._data,
   751					};
   752	
   753					if (darray_push(keys, n)) {
   754						__journal_keys_sort(keys);
   755	
   756						if (keys->nr * 8 > keys->size * 7) {
   757							bch_err(c, "Too many journal keys for slowpath; have %zu compacted, buf size %zu, processed %zu keys at seq %llu",
   758								keys->nr, keys->size, nr_read, le64_to_cpu(i->j.seq));
   759							return bch_err_throw(c, ENOMEM_journal_keys_sort);
   760						}
   761	
   762						BUG_ON(darray_push(keys, n));
   763					}
   764	
   765					nr_read++;
   766				}
   767			}
   768		}
   769	
   770		__journal_keys_sort(keys);
   771		keys->gap = keys->nr;
   772	
   773		bch_verbose(c, "Journal keys: %zu read, %zu after sorting and compacting", nr_read, keys->nr);
   774		return 0;
   775	}
   776	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
