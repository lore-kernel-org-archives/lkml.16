Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C42868B8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692162; cv=none; b=sdMFgn9gmpeXwi/BuRK5vVR1LRoKsQ60fMfqs2dJddm6U5VvZMQ3qqdyITZlXuIKfnlb7Ndu3umH/P4lvlfAu+6Y/XzF4dXbVmbYpZFsWb3b2JmoVEGri0Ygqrz5IfcMPqUr1vzxU+hDONrFkS865r1sMHkRhuHnPwReUXxUKYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692162; c=relaxed/simple;
	bh=JozcuR3TRYk6huh3H+BAAqcEP0hBSuhI8hFHRhcsGoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=umbtFZaifw2+gbZtypD0aMtDww9ovwvcxr+5gSfNT+YRHbtP2BCZIZMwFU9handpOLLH6fDvt2xVaUErVSsQnyE7IPoeyLLEsT/1vqplQpVZ48uSZYorzx/qNJjbOZqQENQ6FPlEsWU4AInCYGz/WWXHk3kEBfYfz9X754pKEZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H66FEoJc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H66FEoJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750692160; x=1782228160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JozcuR3TRYk6huh3H+BAAqcEP0hBSuhI8hFHRhcsGoU=;
  b=H66FEoJcBPBjLDfk/j2TT8lyXZM0aacOcj+567yaJwxQA7GlBPg15YSJ
   hXJaOqx2xH3md02E198B6eIEUqYBhhbZT8xiw39IqZcAmt7Fg7ti3QlMk
   GHkKZzteD1PV8yg0mvKqQ3KYVXJ+/yhuqZHXXddbfjKIT6NVFXr1E/uRl
   pvKrvueI9F0PQwkqG2rzRipRWjdYxUrkoP4dRZMxMQsaOnC1m9brypHLt
   QxO2eGHj1WpFxBuiUYrtGouEsYGHV5ZHs2QorwP/LbKvsSTVoCUQtwjm2
   XjvLwiOkuX8/bQx5jnEPBI+/IOrA8Shx2+TqHjqFAOdbG3fD9dRBHd/kB
   Q==;
X-CSE-ConnectionGUID: FAZHka1DSDOWxHT7UvGsig==
X-CSE-MsgGUID: hmSbboqTQzyzkEh6s6xcvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="55540402"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="55540402"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 08:22:38 -0700
X-CSE-ConnectionGUID: 2rmaz7YQSAqjahi2HCZiuA==
X-CSE-MsgGUID: n/vnjIiZRBuIW8d60qBnSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151400596"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2025 08:22:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTj0D-000P2c-0X;
	Mon, 23 Jun 2025 15:22:33 +0000
Date: Mon, 23 Jun 2025 23:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
	Michael Guralnik <michaelgur@nvidia.com>
Subject: drivers/infiniband/core/nldev.c:1755:12: warning: stack frame size
 (1032) exceeds limit (1024) in 'nldev_newlink'
Message-ID: <202506232316.vUCRAZTq-lkp@intel.com>
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
commit: 12fb1153c53bf9b53e299c9775b84fa7838640f7 RDMA/nldev: Expose whether RDMA monitoring is supported
date:   9 months ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250623/202506232316.vUCRAZTq-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232316.vUCRAZTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506232316.vUCRAZTq-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/infiniband/core/nldev.c:37:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/infiniband/core/nldev.c:37:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/infiniband/core/nldev.c:38:
   In file included from include/rdma/rdma_cm.h:12:
   In file included from include/rdma/ib_addr.h:20:
   include/net/ip.h:472:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     472 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
     138 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
     128 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/infiniband/core/nldev.c:44:
   In file included from drivers/infiniband/core/uverbs.h:49:
   In file included from include/rdma/uverbs_std_types.h:10:
   include/rdma/uverbs_ioctl.h:813:30: warning: default initialization of an object of type 'typeof ((attr->ptr_attr.data))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     813 |         else if (copy_from_user(to, u64_to_user_ptr(attr->ptr_attr.data),
         |                                     ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/infiniband/core/nldev.c:44:
   In file included from drivers/infiniband/core/uverbs.h:49:
   In file included from include/rdma/uverbs_std_types.h:10:
   include/rdma/uverbs_ioctl.h:835:30: warning: default initialization of an object of type 'typeof ((attr->ptr_attr.data))' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     835 |         else if (copy_from_user(to, u64_to_user_ptr(attr->ptr_attr.data),
         |                                     ^
   include/linux/kernel.h:52:2: note: expanded from macro 'u64_to_user_ptr'
      52 |         typecheck(u64, (x));            \
         |         ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   drivers/infiniband/core/nldev.c:2795:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    2795 |         default:
         |         ^
   drivers/infiniband/core/nldev.c:2795:2: note: insert 'break;' to avoid fall-through
    2795 |         default:
         |         ^
         |         break; 
>> drivers/infiniband/core/nldev.c:1755:12: warning: stack frame size (1032) exceeds limit (1024) in 'nldev_newlink' [-Wframe-larger-than]
    1755 | static int nldev_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
         |            ^
   21 warnings generated.


vim +/nldev_newlink +1755 drivers/infiniband/core/nldev.c

3856ec4b93c946 Steve Wise      2019-02-15  1754  
3856ec4b93c946 Steve Wise      2019-02-15 @1755  static int nldev_newlink(struct sk_buff *skb, struct nlmsghdr *nlh,
3856ec4b93c946 Steve Wise      2019-02-15  1756  			  struct netlink_ext_ack *extack)
3856ec4b93c946 Steve Wise      2019-02-15  1757  {
3856ec4b93c946 Steve Wise      2019-02-15  1758  	struct nlattr *tb[RDMA_NLDEV_ATTR_MAX];
3856ec4b93c946 Steve Wise      2019-02-15  1759  	char ibdev_name[IB_DEVICE_NAME_MAX];
3856ec4b93c946 Steve Wise      2019-02-15  1760  	const struct rdma_link_ops *ops;
3856ec4b93c946 Steve Wise      2019-02-15  1761  	char ndev_name[IFNAMSIZ];
3856ec4b93c946 Steve Wise      2019-02-15  1762  	struct net_device *ndev;
3856ec4b93c946 Steve Wise      2019-02-15  1763  	char type[IFNAMSIZ];
3856ec4b93c946 Steve Wise      2019-02-15  1764  	int err;
3856ec4b93c946 Steve Wise      2019-02-15  1765  
df6d27a3097015 Chiara Meiohas  2024-07-30  1766  	err = nlmsg_parse(nlh, 0, tb, RDMA_NLDEV_ATTR_MAX - 1,
3856ec4b93c946 Steve Wise      2019-02-15  1767  			    nldev_policy, extack);
3856ec4b93c946 Steve Wise      2019-02-15  1768  	if (err || !tb[RDMA_NLDEV_ATTR_DEV_NAME] ||
3856ec4b93c946 Steve Wise      2019-02-15  1769  	    !tb[RDMA_NLDEV_ATTR_LINK_TYPE] || !tb[RDMA_NLDEV_ATTR_NDEV_NAME])
3856ec4b93c946 Steve Wise      2019-02-15  1770  		return -EINVAL;
3856ec4b93c946 Steve Wise      2019-02-15  1771  
872f690341948b Francis Laniel  2020-11-15  1772  	nla_strscpy(ibdev_name, tb[RDMA_NLDEV_ATTR_DEV_NAME],
3856ec4b93c946 Steve Wise      2019-02-15  1773  		    sizeof(ibdev_name));
7aefa6237cfe4a Jason Gunthorpe 2020-03-09  1774  	if (strchr(ibdev_name, '%') || strlen(ibdev_name) == 0)
3856ec4b93c946 Steve Wise      2019-02-15  1775  		return -EINVAL;
3856ec4b93c946 Steve Wise      2019-02-15  1776  
872f690341948b Francis Laniel  2020-11-15  1777  	nla_strscpy(type, tb[RDMA_NLDEV_ATTR_LINK_TYPE], sizeof(type));
872f690341948b Francis Laniel  2020-11-15  1778  	nla_strscpy(ndev_name, tb[RDMA_NLDEV_ATTR_NDEV_NAME],
3856ec4b93c946 Steve Wise      2019-02-15  1779  		    sizeof(ndev_name));
3856ec4b93c946 Steve Wise      2019-02-15  1780  
7a54f78d9387b7 Parav Pandit    2019-07-04  1781  	ndev = dev_get_by_name(sock_net(skb->sk), ndev_name);
3856ec4b93c946 Steve Wise      2019-02-15  1782  	if (!ndev)
3856ec4b93c946 Steve Wise      2019-02-15  1783  		return -ENODEV;
3856ec4b93c946 Steve Wise      2019-02-15  1784  
3856ec4b93c946 Steve Wise      2019-02-15  1785  	down_read(&link_ops_rwsem);
3856ec4b93c946 Steve Wise      2019-02-15  1786  	ops = link_ops_get(type);
3856ec4b93c946 Steve Wise      2019-02-15  1787  #ifdef CONFIG_MODULES
3856ec4b93c946 Steve Wise      2019-02-15  1788  	if (!ops) {
3856ec4b93c946 Steve Wise      2019-02-15  1789  		up_read(&link_ops_rwsem);
3856ec4b93c946 Steve Wise      2019-02-15  1790  		request_module("rdma-link-%s", type);
3856ec4b93c946 Steve Wise      2019-02-15  1791  		down_read(&link_ops_rwsem);
3856ec4b93c946 Steve Wise      2019-02-15  1792  		ops = link_ops_get(type);
3856ec4b93c946 Steve Wise      2019-02-15  1793  	}
3856ec4b93c946 Steve Wise      2019-02-15  1794  #endif
3856ec4b93c946 Steve Wise      2019-02-15  1795  	err = ops ? ops->newlink(ibdev_name, ndev) : -EINVAL;
3856ec4b93c946 Steve Wise      2019-02-15  1796  	up_read(&link_ops_rwsem);
3856ec4b93c946 Steve Wise      2019-02-15  1797  	dev_put(ndev);
3856ec4b93c946 Steve Wise      2019-02-15  1798  
3856ec4b93c946 Steve Wise      2019-02-15  1799  	return err;
3856ec4b93c946 Steve Wise      2019-02-15  1800  }
3856ec4b93c946 Steve Wise      2019-02-15  1801  

:::::: The code at line 1755 was first introduced by commit
:::::: 3856ec4b93c9463d36ee39098dde1fbbd29ec6dd RDMA/core: Add RDMA_NLDEV_CMD_NEWLINK/DELLINK support

:::::: TO: Steve Wise <swise@opengridcomputing.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
