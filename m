Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC695293479
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748553911; cv=none; b=F7qduG+L7DJ2oX7c6cbbwd4Z4IwNkxu02XABc6fMKfGQV09RYxmS7w9QIIi4Sn5xUlkLqsumEwZKmw5g+eJC5kCJ6Io4TXtZanXEKyZCDItJ5KoPBsPAlfXWfwnzs46p1MbJLOqmt0mRGWt3Oqrsr/ucENsr0GwFR+c1jZZdE+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748553911; c=relaxed/simple;
	bh=Uram4Fpi1hBv1Z+OwHvJmDzIibcFUZMD0Zn/Y3uVAiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lBOJ2tOKJx6P6UvUZt06kKAValOCNB8DSKourAj6Ycf/7Owu2t7NXF54P6xADdf5jCQscTGHMCwaJ4Bz5Ye3WY+NZzEh8cDwTForU8e/uyPqrxs5yKmpKlpTt0ve4LgAsYAJCVxVspc/Pckx8nzpXFPXwHeXZ/UBkURrP254MAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDLHSQD/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDLHSQD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1376BC4CEE7;
	Thu, 29 May 2025 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748553911;
	bh=Uram4Fpi1hBv1Z+OwHvJmDzIibcFUZMD0Zn/Y3uVAiY=;
	h=Date:From:To:Cc:Subject:From;
	b=MDLHSQD/lzaQH+AUWDvtIZJV6B3ZdXxY+ABWE4g50PzocX/qul4nQ9V/OU73r8pEr
	 XhuXVkkjLILa5q52rdnH1Y+tdCAY+EsimTWpMra+A9hP+vBnCch9wWkE957+inhQUg
	 KCm4FY5xQ0YDosRGzlp+b5UFuWRCbywJaCyIXgDSBniDKiRKxchEow15+FvNE0ZXhw
	 AdYEEFllAzMbCShV5yJQbcOul3A09GRPQHcpW50SWBJYB0vjtwUUPFAmg8kGI3eQ27
	 WPZSlz+StssmR8hY84TAQm7RxtkWg7E5Suh8uPvW1HK9UnoS8tGby+zNwVWyL2yD1h
	 dYSI55miBLdQw==
Date: Thu, 29 May 2025 21:25:09 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] f2fs update for 6.16-rc1
Message-ID: <aDjQtZy0oknTlgmG@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.16-rc1

for you to fetch changes up to 9883494c45a13dc88d27dde4f988c04823b42a2f:

  f2fs: fix to correct check conditions in f2fs_cross_rename (2025-05-28 16:05:25 +0000)

----------------------------------------------------------------
f2fs-for-6.16-rc1

In this round, Matthew converted most of page operations to using folio. Beyond
the work, we've applied some performance tunings such as GC and linear lookup,
in addition to enhancing fault injection and sanity checks.

Enhancement:
 - large number of folio conversions
 - add a control to turn on/off the linear lookup for performance
 - tune GC logics for zoned block device
 - improve fault injection and sanity checks

Bug fix:
 - handle error cases of memory donation
 - fix to correct check conditions in f2fs_cross_rename
 - fix to skip f2fs_balance_fs() if checkpoint is disabled
 - don't over-report free space or inodes in statvfs
 - prevent the current section from being selected as a victim during GC
 - fix to calculate first_zoned_segno correctly
 - fix to avoid inconsistence in between SIT and SSA for zoned block device

As usual, there are several debugging patches and clean-ups as well.

----------------------------------------------------------------
Chao Yu (26):
      f2fs: add a proc entry show inject stats
      f2fs: fix to update injection attrs according to fault_option
      f2fs: fix to set atomic write status more clear
      f2fs: zone: fix to avoid inconsistence in between SIT and SSA
      f2fs: add a fast path in finish_preallocate_blocks()
      f2fs: fix to do sanity check on ino and xnid
      f2fs: support to disable linear lookup fallback
      f2fs: fix to do sanity check on sbi->total_valid_block_count
      f2fs: clean up w/ fscrypt_is_bounce_page()
      f2fs: fix to detect gcing page in f2fs_is_cp_guaranteed()
      f2fs: fix to do sanity check on sit_bitmap_size
      f2fs: zone: fix to calculate first_zoned_segno correctly
      f2fs: sysfs: add encoding_flags entry
      f2fs: sysfs: export linear_lookup in features directory
      f2fs: fix to bail out in get_new_segment()
      f2fs: support FAULT_TIMEOUT
      f2fs: fix to return correct error number in f2fs_sync_node_pages()
      f2fs: don't over-report free space or inodes in statvfs
      f2fs: fix 32-bits hexademical number in fault injection doc
      f2fs: add f2fs_bug_on() to detect potential bug
      f2fs: add f2fs_bug_on() in f2fs_quota_read()
      f2fs: use vmalloc instead of kvmalloc in .init_{,de}compress_ctx
      f2fs: introduce FAULT_VMALLOC
      f2fs: introduce is_{meta,node}_folio
      f2fs: clean up to check bi_status w/ BLK_STS_OK
      f2fs: fix to skip f2fs_balance_fs() if checkpoint is disabled

Christoph Hellwig (5):
      f2fs: return bool from __f2fs_write_meta_folio
      f2fs: remove wbc->for_reclaim handling
      f2fs: always unlock the page in f2fs_write_single_data_page
      f2fs: simplify return value handling in f2fs_fsync_node_pages
      f2fs: return bool from __write_node_folio

Colin Ian King (1):
      f2fs: remove redundant assignment to variable err

Daeho Jeong (1):
      f2fs: handle error cases of memory donation

Eric Biggers (1):
      f2fs: remove unused sbi argument from checksum functions

Jaegeuk Kim (2):
      f2fs: clean up unnecessary indentation
      f2fs: prevent kernel warning due to negative i_nlink from corrupted image

Kairui Song (1):
      f2fs: drop usage of folio_index

Matthew Wilcox (Oracle) (153):
      f2fs: Use a folio in f2fs_compress_free_page()
      f2fs: Use a folio in f2fs_write_raw_pages()
      f2fs: Introduce fio_inode()
      f2fs: Use F2FS_P_SB() in f2fs_is_compressed_page()
      f2fs: Use bio_for_each_folio_all() in __has_merged_page()
      f2fs: Use a folio in add_ipu_page()
      f2fs: Remove access to page->mapping in f2fs_is_cp_guaranteed()
      f2fs: Use a folio in move_data_block()
      f2fs: Use a folio in f2fs_quota_read()
      f2fs: Add f2fs_grab_meta_folio()
      f2fs: Use a folio in commit_checkpoint()
      f2fs: Convert __f2fs_write_meta_page() to __f2fs_write_meta_folio()
      f2fs: Use f2fs_folio_wait_writeback()
      f2fs: Pass a folio to f2fs_submit_merged_ipu_write()
      f2fs: Convert __get_meta_page() to __get_meta_folio()
      f2fs: Convert f2fs_get_tmp_page() to f2fs_get_tmp_folio()
      f2fs: Pass a folio to next_blkaddr_of_node()
      f2fs: Use a folio in f2fs_ra_meta_pages()
      f2fs: Use a folio in f2fs_ra_meta_pages_cond()
      f2fs: Use a folio in write_orphan_inodes()
      f2fs: Use a folio in get_next_nat_page()
      f2fs: Convert get_next_sit_page() to get_next_sit_folio()
      f2fs: Use a folio in f2fs_update_meta_page()
      f2fs: Use a folio in write_current_sum_page()
      f2fs: Use a folio in write_compacted_summaries()
      f2fs: Remove f2fs_grab_meta_page()
      f2fs: Add f2fs_get_meta_folio()
      f2fs: Use a folio in build_sit_entries()
      f2fs: Use a folio in f2fs_recover_orphan_inodes()
      f2fs: Use a folio in validate_checkpoint()
      f2fs: Use a folio in f2fs_get_valid_checkpoint()
      f2fs: Use a folio in f2fs_get_node_info()
      f2fs: Use a folio in __get_nat_bitmaps()
      f2fs: Use a folio in read_compacted_summaries()
      f2fs: Use a folio in read_normal_summaries()
      f2fs: Remove f2fs_get_meta_page()
      f2fs: Convert f2fs_get_meta_page_retry() to f2fs_get_meta_folio_retry()
      f2fs: Pass an address to scan_nat_page()
      f2fs: Add f2fs_get_sum_folio()
      f2fs: Use folios in do_garbage_collect()
      f2fs: Use a folio in check_index_in_prev_nodes()
      f2fs: Use a folio in change_curseg()
      f2fs: Remove f2fs_get_sum_page()
      f2fs: Use a folio in find_in_level()
      f2fs: Use a folio in f2fs_delete_entry()
      f2fs: Use a folio in f2fs_readdir()
      f2fs: Remove f2fs_find_data_page()
      f2fs: Use a folio in f2fs_get_new_data_page()
      f2fs: Use a folio in f2fs_migrate_blocks()
      f2fs: Add f2fs_get_new_data_folio()
      highmem: Add memcpy_folio()
      f2fs: Use a folio in __clone_blkaddrs()
      f2fs: Use a folio in f2fs_defragment_range()
      f2fs: Remove f2fs_get_lock_data_page()
      f2fs: Use a folio in fill_zero()
      f2fs: Use a folio in f2fs_add_regular_entry()
      f2fs: Use a folio in make_empty_dir()
      f2fs: Remove f2fs_get_new_data_page()
      f2fs: Use a folio in f2fs_xattr_fiemap()
      f2fs: Use a folio in ra_data_block()
      f2fs: Use a folio in move_data_block()
      f2fs: Use a folio in f2fs_convert_inline_inode()
      f2fs: Use a folio in f2fs_move_inline_dirents()
      f2fs: Add f2fs_new_node_folio()
      f2fs: Use a folio in f2fs_ra_node_page()
      f2fs: Convert read_node_page() to read_node_folio()
      f2fs: Pass a folio to f2fs_inode_chksum_verify()
      f2fs: Use a folio in f2fs_recover_inode_page()
      f2fs: Remove f2fs_grab_cache_page()
      f2fs: Add f2fs_get_xnode_folio()
      f2fs: Use a folio in write_all_xattrs()
      f2fs: Use a folio in f2fs_recover_xattr_data()
      f2fs: Add f2fs_get_node_folio()
      f2fs: Use folios in f2fs_get_dnode_of_data()
      f2fs: Use a folio in truncate_node()
      f2fs: Use a folio in truncate_nodes()
      f2fs: Use folios in truncate_partial_nodes()
      f2fs: Pass a folio to f2fs_ra_node_pages()
      f2fs: Use a folio in gc_node_segment()
      f2fs: Convert f2fs_move_node_page() to f2fs_move_node_folio()
      f2fs: Convert __write_node_page() to __write_node_folio()
      f2fs: Use a folio in is_alive()
      f2fs: Use a folio in check_index_in_prev_nodes()
      f2fs: Remove f2fs_get_node_page()
      f2fs: Use a folio in prepare_write_begin
      f2fs: Use a folio in __find_data_block()
      f2fs: Use a folio in f2fs_init_inode_metadata()
      f2fs: Pass a folio to make_empty_dir()
      f2fs: Use a folio in f2fs_try_convert_inline_dir()
      f2fs: Use a folio in f2fs_add_inline_entry()
      f2fs: Pass a folio to f2fs_move_inline_dirents()
      f2fs: Pass a folio to f2fs_move_rehashed_dirents()
      f2fs: Use a folio in f2fs_do_truncate_blocks()
      f2fs: Use a folio in f2fs_truncate_xattr_node()
      f2fs: Pass folios to set_new_dnode()
      f2fs: Convert f2fs_convert_inline_page() to f2fs_convert_inline_folio()
      f2fs: Use a folio in read_xattr_block()
      f2fs: Remove f2fs_get_xnode_page()
      f2fs: Use a folio in f2fs_write_inline_data()
      f2fs: Use a folio in f2fs_read_inline_data()
      f2fs: Use a folio in f2fs_recover_inline_data()
      f2fs: Use a folio in f2fs_find_in_inline_dir()
      f2fs: Use a folio in f2fs_empty_inline_dir()
      f2fs: Use a folio in f2fs_read_inline_dir()
      f2fs: Use a folio in f2fs_inline_data_fiemap()
      f2fs: Use a folio in f2fs_update_inode_page()
      f2fs: Use a folio in do_read_inode()
      f2fs: Pass folios to f2fs_init_acl()
      f2fs: Pass a folio to f2fs_setxattr()
      f2fs: Pass a folio to __f2fs_setxattr()
      f2fs: Pass a folio to write_all_xattrs()
      f2fs: Use a folio in read_inline_xattr()
      f2fs: Use a folio in f2fs_recover_inline_xattr()
      f2fs: Remove f2fs_get_inode_page()
      f2fs: Pass a folio to f2fs_getxattr()
      f2fs: Pass a folio to read_inline_xattr()
      f2fs: Pass a folio to do_recover_data()
      f2fs: Pass a folio to f2fs_recover_inline_xattr()
      f2fs: Pass a folio to inline_xattr_addr()
      f2fs: Pass a folio to init_dent_inode()
      f2fs: Pass a folio to f2fs_make_empty_inline_dir()
      f2fs: Pass a folio to f2fs_has_enough_room()
      f2fs: Convert dnode_of_data->inode_page to inode_folio
      f2fs: Pass a folio to f2fs_do_read_inline_data()
      f2fs: Pass a folio to f2fs_truncate_inline_inode()
      f2fs: Pass a folio to __f2fs_find_entry()
      f2fs: Pass a folio to f2fs_find_entry()
      f2fs: Pass a folio to f2fs_parent_dir()
      f2fs: Pass a folio to f2fs_delete_entry()
      f2fs: Pass a folio to f2fs_delete_inline_entry()
      f2fs: Pass a folio to f2fs_recover_inline_data()
      f2fs: Pass a folio to __recover_inline_status()
      f2fs: Pass a folio to inline_data_addr()
      f2fs: Convert f2fs_put_page_dic() to f2fs_put_folio_dic()
      f2fs: Pass a folio to f2fs_set_link()
      f2fs: Use a folio in need_inode_page_update()
      f2fs: Use a folio in f2fs_truncate_meta_inode_pages()
      f2fs: Use a folio in f2fs_cache_compressed_page()
      f2fs: Use a folio in prepare_compress_overwrite()
      f2fs: Convert f2fs_load_compressed_page() to f2fs_load_compressed_folio()
      f2fs: Use a folio in f2fs_encrypt_one_page()
      f2fs: Use a folio in redirty_blocks()
      f2fs: Use a folio in f2fs_wait_on_block_writeback()
      f2fs: Pass a folio to f2fs_init_read_extent_tree()
      f2fs: Return a folio from f2fs_init_inode_metadata()
      f2fs: Pass a folio to f2fs_update_inode()
      f2fs: Pass a folio to set_nid()
      f2fs: Convert dnode_of_data->node_page to node_folio
      f2fs: Pass a folio to get_dnode_addr()
      f2fs: Convert fsync_node_entry->page to folio
      f2fs: Remove f2fs_new_node_page()
      f2fs: Use a folio in flush_inline_data()
      f2fs: Convert clear_node_page_dirty() to clear_node_folio_dirty()

Zhiguo Niu (2):
      f2fs: use d_inode(dentry) cleanup dentry->d_inode
      f2fs: fix to correct check conditions in f2fs_cross_rename

yohan.joung (3):
      f2fs: prevent the current section from being selected as a victim during GC
      f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.
      f2fs: add ckpt_valid_blocks to the section entry

 Documentation/ABI/testing/sysfs-fs-f2fs |  67 ++--
 Documentation/filesystems/f2fs.rst      |  52 +--
 fs/f2fs/acl.c                           |  33 +-
 fs/f2fs/acl.h                           |  10 +-
 fs/f2fs/checkpoint.c                    | 242 ++++++-------
 fs/f2fs/compress.c                      | 166 ++++-----
 fs/f2fs/data.c                          | 248 ++++++-------
 fs/f2fs/dir.c                           | 243 +++++++------
 fs/f2fs/extent_cache.c                  |  10 +-
 fs/f2fs/f2fs.h                          | 307 +++++++++-------
 fs/f2fs/file.c                          | 216 +++++------
 fs/f2fs/gc.c                            | 143 ++++----
 fs/f2fs/inline.c                        | 310 ++++++++--------
 fs/f2fs/inode.c                         | 117 +++---
 fs/f2fs/namei.c                         | 131 +++----
 fs/f2fs/node.c                          | 610 +++++++++++++++-----------------
 fs/f2fs/node.h                          |  12 +-
 fs/f2fs/recovery.c                      | 178 +++++-----
 fs/f2fs/segment.c                       | 219 +++++++-----
 fs/f2fs/segment.h                       | 132 +++++--
 fs/f2fs/shrinker.c                      |  13 +-
 fs/f2fs/super.c                         | 168 ++++++---
 fs/f2fs/sysfs.c                         |  41 ++-
 fs/f2fs/xattr.c                         | 116 +++---
 fs/f2fs/xattr.h                         |  24 +-
 include/linux/f2fs_fs.h                 |   1 +
 include/linux/highmem.h                 |  27 ++
 include/trace/events/f2fs.h             |   5 +-
 28 files changed, 2057 insertions(+), 1784 deletions(-)
